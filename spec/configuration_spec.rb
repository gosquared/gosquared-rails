require 'spec_helper'

describe GosquaredRails::Configuration do

  subject(:gs) { described_class.new() }

  describe '#site_token' do
    it 'responds to #site_token' do
      expect(gs).to respond_to(:site_token)
    end
  end

  describe '#track_local' do
    it 'returns _gs track local' do
      expect(gs.track_local).to eq("_gs('set', 'trackLocal', true);")
    end

  end

  describe '#anonymize_ip' do
    it 'returns _gs anonymize_ip true' do
      expect(gs.anonymize_ip).to eq("_gs('set', 'anonymizeIP', false);")
    end
  end

  describe '#use_cookies' do
    it 'returns _gs useCookies true' do
      expect(gs.use_cookies).to eq("_gs('set', 'useCookies', true);")
    end
  end

  describe '#cookie_domain' do
    it 'returns _gs cookieDomain undefined' do
      expect(gs.cookie_domain).to eq("_gs('set', 'cookieDomain', undefined);")
    end
  end


  describe '#referrer' do
    it 'returns _gs referrer document.referrer' do
      expect(gs.referrer).to eq("_gs('set', 'referrer', document.referrer);")
    end
  end

  describe '#track_hash' do
    it 'returns _gs trackHash false' do
      expect(gs.track_hash).to eq("_gs('set', 'trackHash', false);")
    end
  end

  describe '#track_params' do
    it 'returns _gs anonymize_ip true' do
      expect(gs.track_params).to eq("_gs('set', 'trackParams', true);")
    end
  end


  describe '#config_options' do
    it 'responds to #config_options' do
      expect(gs).to respond_to(:config_options)
    end
    it 'returns config option if value associated' do
      gs.track_local
      expect(gs.config_options).to eq gs.track_local
    end
    it 'returns multiple config options if value associated' do
      gs.track_hash
      gs.track_params
      expect(gs.config_options).to eq "_gs('set', 'trackHash', false); _gs('set', 'trackParams', true);"
    end

  end




end

