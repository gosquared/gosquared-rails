require_relative 'injector'
module GosquaredRails
  class GoSquaredRailtie < Rails::Railtie
    initializer "my_initialization" do |app|
      ActionController::Base.send(:include, Injector::Filter)
    end
  end
end
