class VisionApiHelpers::ExtractSafeSearch < VisionApiHelpers::VisionAPI

  def request_json
    {
      requests: [
        {
          image: {
            content: @image
          },
          features: [
            {
              type: "SAFE_SEARCH_DETECTION",
              maxResults: 5
            }
          ]
        }
      ]
    }.to_json
  end
end
