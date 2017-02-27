class VisionApiHelpers::ExtractText < VisionApiHelpers::VisionAPI

  def request_json
    {
      requests: [
        {
          image: {
            content: @image
          },
          features: [
            {
              type: "TEXT_DETECTION",
              maxResults: 5
            }
          ]
        }
      ]
    }.to_json
  end
end
