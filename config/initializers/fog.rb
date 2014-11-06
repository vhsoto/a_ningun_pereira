if Rails.env.development?
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => "AKIAIZVFZ6RKXAHMFZMA",                        # required
    :aws_secret_access_key  => "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"                       # required
    
  }
  config.fog_directory  = 'anp-dev'                        # required
  config.fog_public     = true                                        # optional, defaults to true
   
end

end


