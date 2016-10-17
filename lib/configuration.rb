module GosquaredRails
  class Configuration
    attr_accessor :site_token, :track_local, :anonymize_ip, :cookie_domain,
    :use_cookies, :referrer, :track_hash, :track_params

    def initialize
      @site_token = nil
      @track_local = nil
      @anonymize_ip = nil
      @cookie_domain = nil
      @use_cookies = nil
      @referrer = nil
      @track_hash = nil
      @track_params = nil
    end

    def config_options
      @configurations = [set_track_local, set_anonymize_ip,
      set_cookie_domain, set_use_cookies, set_referrer, set_track_hash, set_track_params]
      @display_config = []
      @configurations.each do |config|
      @display_config << config if config
      end
      @display_config.join(" ")
    end

    def set_track_local
     "_gs('set', 'trackLocal', true);" if track_local == true
    end

    def set_anonymize_ip
       "_gs('set', 'anonymizeIP', false);" if @anonymize_ip == true
    end

    def set_cookie_domain
       "_gs('set', 'cookieDomain', undefined);" if @cookie_domain == true
    end

    def set_use_cookies
       "_gs('set', 'useCookies', true);" if @use_cookies == true
    end

    def set_referrer
       "_gs('set', 'referrer', document.referrer);" if @referrer == true
    end

    def set_track_hash
        "_gs('set', 'trackHash', false);" if @track_hash == true
    end

    def set_track_params
        "_gs('set', 'trackParams', true);" if @track_params == true
    end

  end
end


