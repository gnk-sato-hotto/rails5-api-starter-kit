class VisionApiHelpers::ExtractLabel < VisionApiHelpers::VisionAPI

  def request_json
    {
      requests: [
        {
          image: {
            content: @image
          },
          features: [
            {
              type: "LABEL_DETECTION",
              maxResults: 5
            }
          ]
        }
      ]
    }.to_json
  end
end
