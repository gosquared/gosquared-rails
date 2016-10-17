require 'spec_helper'

describe GosquaredRails::Configuration do

  subject(:gs) { described_class.new() }

  describe '#site_token' do
    it 'responds to #site_token' do
      expect(gs).to respond_to(:site_token)
    end
  end

  describe '#set_local_configuration' do
    it 'returns _gs track local' do
      gs.track_local = true
      expect(gs.set_track_local).to eq("_gs('set', 'trackLocal', true);")
    end

  end

  describe '#set_anonymize_ip' do
    it 'returns _gs anonymize_ip true' do
      gs.anonymize_ip = true
      expect(gs.set_anonymize_ip).to eq("_gs('set', 'anonymizeIP', false);")
    end
  end

  describe '#set_use_cookies' do
    it 'returns _gs useCookies true' do
      gs.use_cookies = true
      expect(gs.set_use_cookies).to eq("_gs('set', 'useCookies', true);")
    end
  end

  describe '#set_cookie_domain' do
    it 'returns _gs cookieDomain undefined' do
      gs.cookie_domain = true
      expect(gs.set_cookie_domain).to eq("_gs('set', 'cookieDomain', undefined);")
    end
  end


  describe '#set_referrer' do
    it 'returns _gs referrer document.referrer' do
      gs.referrer = true
      expect(gs.set_referrer).to eq("_gs('set', 'referrer', document.referrer);")
    end
  end

  describe '#set_track_hash' do
    it 'returns _gs trackHash false' do
      gs.track_hash = true
      expect(gs.set_track_hash).to eq("_gs('set', 'trackHash', false);")
    end
  end

  describe '#set_track_params' do
    it 'returns _gs anonymize_ip true' do
      gs.track_params = true
      expect(gs.set_track_params).to eq("_gs('set', 'trackParams', true);")
    end
  end


  describe '#config_options' do
    it 'responds to #config_options' do
      expect(gs).to respond_to(:config_options)
    end

    it 'returns config option if value associated' do
      expect(gs.config_options).to eq ""
    end

    it 'returns multiple config options if value associated' do
     gs.track_hash = true
     gs.track_params = true
     expect(gs.config_options).to eq "_gs('set', 'trackHash', false); _gs('set', 'trackParams', true);"
   end
 end




end

