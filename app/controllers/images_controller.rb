class ImagesController < ApplicationController
  require 'open-uri'
  before_filter :authenticate_user!

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(:file => params[:image][:file])
    if @image.save
      flash[:notice] = "Image uploaded, yo!"
      translate_image
      @image.items_from_receipt(current_user)
      redirect_to items_path
    else
      flash[:error] = "Something went wrong, bro."
      render new_image_path
    end
  end

  private
    def translate_image
      send_image_for_translation
    end

    def send_image_for_translation
      ocr_api_url = "http://svc.webservius.com/v1/wisetrend/wiseocr/submit?wsvKey=BMCxkJ6jPP15FBZdtJ5aY864KvRsxC1x"
      body_string = "<Job><InputURL>#{ @image.stored_at }</InputURL></Job>"
      options = { :body => body_string, :headers => { 'Content-type' => "text/xml" }, :timeout => 120 }
      get_translation(HTTParty.post(ocr_api_url, options))
    end

    def get_translation(response)
      @job_uri = Nokogiri::XML(response.to_xml).xpath("//JobURL")
      while !image_done_processing?
        warn ("*" * 50) + "\n" + "Looping again.."
        sleep 2
      end
      job_uri_doc = Nokogiri::XML(open(@job_uri.children.text))
      translation_raw = open(job_uri_doc.xpath('//Uri')[0].children.text).read
      @image.update_attributes(:translation => translation_raw)
    end

    def image_done_processing?
      Nokogiri::XML(open(@job_uri.children.text)).xpath("//Status").children.text == "Finished"
    end
end