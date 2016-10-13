require 'spec_helper'

describe GosquaredRails::Configuration do

subject(:gs) { described_class.new() }

it 'responds to #site_token' do
  expect(gs).to respond_to(:site_token)
end

end
