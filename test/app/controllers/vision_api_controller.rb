require 'open-uri'

class VisionApiController < ApplicationController
  include VisionAPIConnector
  # params: 
  # {"token"=>"YbKWfqtGqaTShbYJV2AO60so",
  #  "team_id"=>"T1XAQ3FNZ",
  #  "team_domain"=>"slackforsatotest",
  #  "service_id"=>"146478841827",
  #  "channel_id"=>"C4AG39X5Y",
  #  "channel_name"=>"face_detection",
  #  "timestamp"=>"1488083877.000009",
  #  "user_id"=>"U1X92VB8T",
  #  "user_name"=>"sato_bot",
  #  "text"=>"<@U1X92VB8T|sato_bot> uploaded a file: 
  #  <https://slackforsatotest.slack.com/files/sato_bot/F4AJ98ZT6/images___1.jpeg|images | 1.jpeg>"}
  #
  def face
    if !uploaded_file?(params)
      render json: {}
      return
    end

    p "@@@@ upload file!"
    p "filename: #{get_filename(params["text"])}"

    filename = get_filename(params["text"])
    if !valid_file_type?(filename)
      render json: {}
      return
    end

    p "@@@@ valid file type!"
    base64 = Base64.strict_encode64(open(filename).read)
    result = get_result('face', base64: base64)
    return render(json: {}) if result.nil?

    render json: result
    #{
     # face: result["responses"]
     #       .first["faceAnnotations"]
    #}
  end

  def uploaded_file?(params)
    reg = Regexp.new("^<#{params["user_id"]}|#{params["user_name"]}> uploaded a file:")
    !params["text"].match(reg).nil?
  end

  def get_filename(text)
    begin
      text.split(' ')[4].gsub(/<|>/, '').split('|').first
    rescue => e
      p "Error has occured! extract filename"
      p "#{e.messages}"
      nil
    end
  end

  def valid_file_type?(filename)
    file_type = filename.split('.').last 
    ["jpeg", "jpg", "png", "gif"].include?(file_type)
  end

  def get_result(type, base64:)
    return nil if base64.nil?

    extractor = VisionAPIConnector.get_extractor(type, base64: base64)
    result    = extractor.fetch_result
    return nil if result[:error]
    result
  end
end
