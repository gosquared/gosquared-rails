require 'spec_helper'

describe GosquaredRails::Configuration do

  subject(:gs) { described_class.new() }

  describe '#site_token' do
    it 'responds to #site_token' do
      expect(gs).to respond_to(:site_token)
    end
  end

  describe '#track_local' do
    it 'responds to #track_local' do
      expect(gs).to respond_to(:track_local)
    end

    it 'returns _gs track local' do
      expect(gs.track_local).to eq("_gs('set', 'trackLocal', true);")
    end

  end

  describe '#anonymize_ip' do
    it 'responds to #anonymize_ip' do
      expect(gs).to respond_to(:anonymize_ip)
    end

    it 'returns _gs anonymize_ip true' do
      expect(gs.anonymize_ip).to eq("_gs('set', 'anonymizeIP', false);")
    end
  end

  describe '#config_options' do
    it 'responds to #config_options' do
      expect(gs).to respond_to(:config_options)
    end
    it 'returns all config options if value associated' do
      expect(gs.config_options).to eq( [@track_local, @anonymize_ip] )
    end

  end




end

