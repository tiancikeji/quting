require 'spec_helper'

describe "Mfiles" do
  describe "GET /mfiles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mfiles_path
      response.status.should be(200)
    end
  end
end
