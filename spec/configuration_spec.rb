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

    it 'returns _gs track local true if arguement is true' do
      expect(gs.track_local).to eq("_gs('set', 'trackLocal', true);")
    end

  end

end
