require 'rails_helper'

RSpec.describe GithubController, type: :controller do
  context "POST searh" do

    it "assigns a github user array" do
      post :search , :params => { username: "murraycatto"}
      expect(assigns(:github_users).first).to be_a_new(Github::User)
    end

  end
end
