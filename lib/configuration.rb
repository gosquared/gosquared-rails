module GosquaredRails
  class Configuration
    attr_accessor :site_token
    def initialize
      @site_token = nil
      @track_local = nil
      @anonymize_ip = nil
    end

    def config_options
       @display_config = []
      [@track_local, @anonymize_ip].each do |config|
        @display_config << config if config
      end
      @display_config.join(" ")
    end

    def track_local
      @track_local = "_gs('set', 'trackLocal', true);"
    end

    def anonymize_ip
      @anonymize_ip = "_gs('set', 'anonymizeIP', false);"
    end

  end
end
