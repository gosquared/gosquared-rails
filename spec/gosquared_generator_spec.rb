require 'spec_helper'
require "#{Rails.root}/app/generators/config_generator.rb"
require "generator_spec"
require 'fileutils'


describe GosquaredRails::Generators::ConfigGenerator, :type => :generator do
  destination File.expand_path("../config")
  arguments %w('test_site_token')
  before(:all) do
    FileUtils.rm_rf("#{Rails.root}/app/config/")
    run_generator
  end

  it 'creates a test initializer' do
      assert_file "#{Rails.root}/app/config/initializers/gosquared_rails.rb", /test_site_token/
  end
end

