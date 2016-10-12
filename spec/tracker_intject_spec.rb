require 'helpers/anonymous_controller_helper_spec.rb'

describe ApplicationController, :type => :controller do
 controller do
   def index
     render :html => true
   end

   def new
     render :json => true
   end

 end

 it "Adds the GoSquared tracking code if response HTML" do
  expect(controller).to receive(:add_gosquared_script)
  get :index
end

it "Does not add the GoSquared tracking code if response is not HTML" do
  expect(controller).not_to receive(:add_gosquared_script)
  get :new
end

end
