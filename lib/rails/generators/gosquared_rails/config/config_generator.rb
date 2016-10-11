require 'rails/generators/base'

module GosquaredRails
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      argument :site_token

      def copy_initializer_file
        @site_token = site_token
        template("gosquared_rails.rb.erb", File.join("config/initializers/gosquared_rails.rb"))
      end
    end
  end
end
