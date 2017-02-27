class VisionApiHelpers::ExtractFace < VisionApiHelpers::VisionAPI

  def request_json
    {
      requests: [
        {
          image: {
            content: @image
          },
          features: [
            {
              type: "FACE_DETECTION",
              maxResults: 5
            }
          ]
        }
      ]
    }.to_json
  end
end
