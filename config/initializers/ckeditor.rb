# Use this hook to configure ckeditor
if Object.const_defined?("Ckeditor")
  Ckeditor.setup do |config|
    require "ckeditor/orm/active_record"

    config.image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]

    # Allowed attachment file types for upload.
    # Set to nil or [] (empty array) for all file types
    # config.attachment_file_types = ["doc", "docx", "xls", "odt", "ods", "pdf", "rar", "zip", "tar", "swf"]
  end
end
