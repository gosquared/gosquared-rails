require 'spec_helper'

describe GosquaredRails::Configuration do

  subject(:gs) { described_class.new() }

  describe '#site_token' do
    it 'responds to #site_token' do
      expect(gs).to respond_to(:site_token)
    end
  end

  describe '#set_local_configuration' do
    it 'returns _gs track local when track_local is true' do
      gs.track_local = true
      expect(gs.set_track_local).to eq("_gs('set', 'trackLocal', true);")
    end

    it 'returns nil when not  true' do
      expect(gs.set_track_local).to eq nil
    end

  end

  describe '#set_anonymize_ip' do
    it 'returns _gs anonymize_ip true' do
      gs.anonymize_ip = true
      expect(gs.set_anonymize_ip).to eq("_gs('set', 'anonymizeIP', true);")
    end

    it 'returns nil when anonymize_ip is not true' do
      expect(gs.set_anonymize_ip).to eq nil
    end
  end

  describe '#set_use_cookies' do
    it 'returns _gs useCookies true when use_cookies is true' do
      gs.use_cookies = true
      expect(gs.set_use_cookies).to eq("_gs('set', 'useCookies', true);")
    end
    it 'returns nil when use_cookies is not true' do
      expect(gs.set_use_cookies).to eq nil
    end
  end

  describe '#set_cookie_domain' do
    it 'returns _gs cookieDomain undefined when cookie_domain is true' do
      gs.cookie_domain = '.your_domain.com'
      expect(gs.set_cookie_domain).to eq("_gs('set', 'cookieDomain', '.your_domain.com');")
    end
    it 'returns nil when cookie_domain is not true' do
      expect(gs.set_cookie_domain).to eq nil
    end
  end


  describe '#set_referrer' do
    it 'returns _gs referrer document.referrer when referrer is true' do
      gs.referrer = 'some other url'
      expect(gs.set_referrer).to eq("_gs('set', 'referrer', 'some other url');")
    end
    it 'returns nil when set_referrer is not true' do
      expect(gs.set_referrer).to eq nil
    end
  end

  describe '#set_track_hash' do
    it 'returns _gs trackHash false when track_hash is true' do
      gs.track_hash = true
      expect(gs.set_track_hash).to eq("_gs('set', 'trackHash', false);")
    end
    it 'returns nil when track_hash is not true' do
      expect(gs.set_track_hash).to eq nil
    end
  end

  describe '#set_track_params' do
    it 'returns _gs trackParams true when track_params is true' do
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

