require 'tracker_inject/railtie' if defined? (Rails)
require_relative "configuration"

module GosquaredRails
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
   block_given? ? yield(configuration) : configuration
  end

end
