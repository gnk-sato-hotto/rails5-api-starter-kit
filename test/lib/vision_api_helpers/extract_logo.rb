class VisionApiHelpers::ExtractLogo < VisionApiHelpers::VisionAPI

  def request_json
    {
      requests: [
        {
          image: {
            content: @image
          },
          features: [
            {
              type: "LOGO_DETECTION",
              maxResults: 5
            }
          ]
        }
      ]
    }.to_json
  end
end
