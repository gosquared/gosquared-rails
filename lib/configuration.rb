module GosquaredRails
  class Configuration
    attr_accessor :site_token
      def initialize
        @site_token = nil
        @track_local = nil
      end

     def track_local
      "_gs('set', 'trackLocal', true);"
    end

  end
end
