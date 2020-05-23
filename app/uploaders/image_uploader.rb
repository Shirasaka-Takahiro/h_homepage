class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagi
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
    storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  version :thumb300 do
    process resize_to_fit: [300, 300]
  end


  version :thumb200 do
    process resize_to_fit: [100, 100]
  end

  version :thumb150 do
    process resize_to_fit: [150, 150]
  end

  version :thumb100 do
    process resize_to_fill: [100, 100]
  end

  version :thumb100x50 do
    process resize_to_fit: [100, 50]
  end

  version :thumb80 do
    process resize_to_fit: [80, 80]
  end
 
  version :thumb640 do
    process resize_to_fit: [640, 640]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process :resize_to_limit => [640, 640]

  def fix_exif_rotation
    manipulate! do |img|
      img.auto_orient!
      img = yield(img) if block_given?
      img
    end
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def filename
    original_filename if original_filename
  end

end
