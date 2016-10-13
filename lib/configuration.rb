module GosquaredRails
  class Configuration
    attr_accessor :site_token
    def initialize
      @site_token = nil
      @track_local = nil
      @anonymize_ip = nil
      @cookie_domain = nil
      @use_cookeis = nil
      @referrer = nil
      @track_hash = nil
      @track_params = nil
    end

    def config_options
      @configurations = [@site_token, @track_local, @anonymize_ip,
      @cooke_domain, @use_cookies, @referrer, @track_hash, @track_params]
      @display_config = []
      @configurations.each do |config|
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

    def cookie_domain
      @cookie_domain = "_gs('set', 'cookieDomain', undefined);"
    end

    def use_cookies
      @use_cookies = "_gs('set', 'useCookies', true);"
    end

    def referrer
       @referrer = "_gs('set', 'referrer', document.referrer);"
    end

    def track_hash
        @track_hash = "_gs('set', 'trackHash', false);"
    end

    def track_params
        @track_params = "_gs('set', 'trackParams', true);"
    end

  end
end


