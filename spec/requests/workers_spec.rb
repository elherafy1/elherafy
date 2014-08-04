require 'rails_helper'

RSpec.describe "Workers", :type => :request do
  describe "GET /workers" do
    it "works! (now write some real specs)" do
      get workers_path
      expect(response.status).to be(200)
    end
  end
end
