module Config
  class << self
    
    def file
      @file ||= begin
        hash = YAML.load_file("/home/mathivanan/git/qa_training/config.yml")
        hash.transform_keys(&:to_sym)
      end
    end
    
    def get_value(key)
      file[key]
    end
    
    def credentials_of(value)
      file[:users][value.to_s]
    end
  end
end
