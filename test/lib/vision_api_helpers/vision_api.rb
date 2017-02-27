
class VisionApiHelpers::VisionAPI

  def initialize(base64_image:)
    @key          = 'AIzaSyAPzppaXGi_UQp8RqS0zlKXn4X-Un5K5hM'
    @image        = base64_image
    @connection   = Faraday.new(:url => 'https://vision.googleapis.com') do |builder|
      builder.request  :url_encoded
      builder.response :logger
      builder.adapter  :net_http
    end
  end

  def fetch_result
    begin
      p request_json
      res = @connection.post do |req|
        req.url "/v1/images:annotate?key=#{@key}"
        req.headers['Content-Type'] = 'application/json'
        req.body = request_json
      end
      p res.body
      p "@@@@@@@"
      p "@@@@@@@"
      p "@@@@@@@"
      p "@@@@@@@"
      JSON.parse(res)
    rescue => e
      error_callback(error: e)
    end
  end

  def request_json
  end

  def error_callback(error:)
    p error
    {error: true}
  end

end

