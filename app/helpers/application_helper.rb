module ApplicationHelper
  def active_storage_to_base64_image(image)
    require "base64"
    file = File.open(ActiveStorage::Blob.service.path_for(image.processed.key))
    base64 = Base64.encode64(file.read).gsub(/\s+/, '')
    file.close
    "data:image/png;base64,#{Rack::Utils.escape(base64)}"
  end
end
