require 'spec_helper'

describe GosquaredRails do

  describe 'self.configuration' do

   context 'when no configuration has been set' do
     it 'creates a new instance of the Configuration class' do
      expect(GosquaredRails.configuration).to be_an_instance_of(GosquaredRails::Configuration)
    end
  end

  context 'when configuration has been set' do

    it 'does not create a new instance of the Configuration class when config is set' do
     GosquaredRails.configuration = 'config'
     expect(GosquaredRails.configuration).to eq('config')
   end
 end

end

describe 'self.configure' do

  before(:each) do
    GosquaredRails.configuration = nil
  end

  it 'sets an attr_accessor on the Configuration class through a block' do
    expect(GosquaredRails.configure { | config | config.site_token = 'token'}).to eq (GosquaredRails.configuration.site_token)
  end

   it 'returns the value of GosquaredRails.configuration if no block given' do
    GosquaredRails.configuration = nil
    expect(GosquaredRails.configure).to be_an_instance_of(GosquaredRails::Configuration)
  end

end

end
