class VisionApiHelpers::ExtractLandMark < VisionApiHelpers::VisionAPI

  def request_json
    {
      requests: [
        {
          image: {
            content: @image
          },
          features: [
            {
              type: "LANDMARK_DETECTION",
              maxResults: 5
            }
          ]
        }
      ]
    }.to_json
  end
end
