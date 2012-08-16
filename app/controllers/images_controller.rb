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
      warn ("*" * 50) + "\n" + 'starting translate'
      sleep 2
      warn @image.stored_at
      translate_image
      @image.items_from_receipt(current_user)
      redirect_to root_path
    else
      flash[:error] = "Something went wrong, bro."
      render new_image_path
    end
  end

  private
    def translate_image
      #old key BMCxkJ6jPP15FBZdtJ5aY864KvRsxC1x
      ocr_api_url = "http://svc.webservius.com/v1/wisetrend/wiseocr/submit?wsvKey=kbPy3KcUFj6s1lJQHnfshS7fSi_bpXXh"
      body_string = "<Job><InputURL>#{ @image.stored_at }</InputURL></Job>"
      options = { :body => body_string, :headers => { 'Content-type' => "text/xml" }, :timeout => 120 }
      get_translation(HTTParty.post(ocr_api_url, options))
      @image.update_attributes(:translation => @raw_translation)
    end

    def get_translation(response)
      warn "*"*50
      warn response
      @job_uri = Nokogiri::XML(response.to_xml).xpath("//JobURL")
      while !image_done_processing?
        warn ("*" * 50) + "\n" + "Checking OCR processing status again.."
        sleep 2
      end
      get_job_uri
      get_raw_translation
    end

    def get_raw_translation
      @raw_translation = open(@job_uri_doc.xpath('//Uri')[0].children.text).read.gsub(/\W/, '')
    end

    def get_job_uri
      @job_uri_doc = Nokogiri::XML(open(@job_uri.children.text))
    end

    def image_done_processing?
      warn "*"*50
      warn Nokogiri::XML(open(@job_uri.children.text)).xpath("//Status").children.text
      Nokogiri::XML(open(@job_uri.children.text)).xpath("//Status").children.text == "Finished"
    end
end