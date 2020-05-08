require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
#   if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'nyblog-bucket'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: "AKIA3P663XOFTB6T4AUK",
      aws_secret_access_key: "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",
      region:'ap-northeast-1',
      path_style: true
    }
#   else
    # config.storage :file
    # config.enable_processing = false if Rails.env.test?
#   end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
