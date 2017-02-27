module VisionAPIConnector
  extend ActiveSupport::Concern

  def get_extractor(type, base64:)
    case type
    when 'face'
      return VisionApiHelpers::ExtractFace.new(base64_image: base64)
    when 'landmark'
      return VisionApiHelpers::ExtractLandmark.new(base64_image: base64)
    when 'logo'
      return VisionApiHelpers::ExtractLogo.new(base64_image: base64)
    when 'label'
      return VisionApiHelpers::ExtractLabel.new(base64_image: base64)
    when 'text'
      return VisionApiHelpers::ExtractText.new(base64_image: base64)
    when 'safe_search'
      return VisionApiHelpers::ExtractSafeSearch.new(base64_image: base64)
    else
      nil
    end
  end
  module_function :get_extractor

end

