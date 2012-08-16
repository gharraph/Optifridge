class ImagesController < ApplicationController
  require 'open-uri'
  before_filter :authenticate_user!

  def new
    @image = Image.new
  end

  def create
    check_if_file_exists
    @image = Image.new(:file => params[:image][:file])
    if @image.save
      flash[:notice] = "Image uploaded, yo!"
      warn ("*" * 50) + "\n" + 'starting translate'
      sleep 2
      warn @image.stored_at
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
      #ocr_api_url = "http://svc.webservius.com/v1/wisetrend/wiseocr/submit?wsvKey=BMCxkJ6jPP15FBZdtJ5aY864KvRsxC1x"
      
      ocr_api_url = "http://svc.webservius.com/v1/wisetrend/wiseocr/submit?wsvKey=kbPy3KcUFj6s1lJQHnfshS7fSi_bpXXh"
      body_string = "<Job><InputURL>#{ @image.stored_at }</InputURL></Job>"
      options = { :body => body_string, :headers => { 'Content-type' => "text/xml" }, :timeout => 120 }
      warn 'about to get translation'
      get_translation(HTTParty.post(ocr_api_url, options))
      warn 'done getting translation'
    end

    def get_translation(response)
      warn response.inspect
      warn 'getting translation'
      @job_uri = Nokogiri::XML(response.to_xml).xpath("//JobURL")
      warn @job_uri.inspect
      warn 'job uri acquired'
      while !image_done_processing?
        warn ("*" * 50) + "\n" + "Looping again.."
        sleep 2
      end
      warn 'at job uri doc'
      job_uri_doc = Nokogiri::XML(open(@job_uri.children.text))
      warn 'job_uri_doc' + job_uri_doc.inspect
      translation_raw = open(job_uri_doc.xpath('//Uri')[0].children.text).gsub(/\W/,'')
      warn 'translation raw' + translation_raw.inspect
      @image.update_attributes(:translation => translation_raw)
      warn ("*" * 50) + "\n" + 'get_translation done'
    end

    def image_done_processing?
      warn "Status at #{ @job_uri.children.text.inspect } is:"
      warn Nokogiri::XML(open(@job_uri.children.text)).xpath("//Status").children.text
      Nokogiri::XML(open(@job_uri.children.text)).xpath("//Status").children.text == "Finished"
    end
    
    def check_if_file_exists
      if params[:image][:file].nil?
        flash[:error] = 'I need a file, dude.'
        render new_image_path
      end
    end
end