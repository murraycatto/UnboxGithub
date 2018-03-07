require 'rails_helper'

RSpec.describe GithubController, type: :controller do
  context "POST searh" do

    it "assigns a github user array" do
      post :search, params:{:format => 'js', username: "murraycatto"}
      expect(assigns(:github_users).is_a?(Array)).to eq(true)
    end

  end

  context "GET github_user" do

    it "assigns a github user" do
      get :show, params:{username: "murraycatto"}
      expect(assigns(:github_user).is_a?(Github::User)).to eq(true)
    end

  end
end
