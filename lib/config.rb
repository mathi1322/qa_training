module Config
  class << self
    def configuration
      @configuration ||= begin
        hash = YAML.load_file("/home/mathivanan/git/qa_training/config.yml")
        hash.transform_keys(&:to_sym)
      end
    end
    def get_value(key)
      configuration[key]
    end
    def credentials_of(reference)
      @configuration[:users][reference.to_s]
    end
  end
end