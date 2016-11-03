require 'spec_helper'

describe PropertyConfig do

 subject(:props) { described_class.new() }

describe "sort_property_fields" do
  it 'sorts properties and extracts custom props' do
    hash = {id:'1', email:'japple@seedfunding.com', name: 'Johnny Appleseed',
     first_name: 'Johnny', last_name: 'Appleseed',
     username: "Johnny Appleseed",
     phone: '+4412345678',
     created_at: '03/11/1982',
     plan_tier: 'Professional',
     monthly_mrr: 2 }
     props.sort_property_fields(hash)
     expect(props.gosquared_custom_properties).to eq("custom: { \n plan_tier: 'Professional',\n monthly_mrr: '2',\n }")
   end

   it 'sorts properties and extracts standard props' do
    hash = {id:'1', email:'japple@seedfunding.com', name: 'Johnny Appleseed',
     first_name: 'Johnny', last_name: 'Appleseed',
     username: "Johnny Appleseed",
     phone: '+4412345678',
     created_at: '03/11/1982',
     plan_tier: 'Professional',
     monthly_mrr: 2 }
     props.sort_property_fields(hash)
     expect(props.gosquared_standard_properties).to eq(" { \n id: '1',\n email: 'japple@seedfunding.com',\n name: 'Johnny Appleseed',\n first_name: 'Johnny',\n last_name: 'Appleseed',\n username: 'Johnny Appleseed',\n phone: '+4412345678',\n created_at: '03/11/1982',\n ")
   end
 end


end
