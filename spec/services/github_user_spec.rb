require 'rails_helper'

describe 'Github User' do

  context "Search users" do
    it 'assigns an array of users' do
      github_users = Github::User.search("murraycatto")
      expect(github_users.is_a?(Array)).to be(true)
    end
  end

  context "Find a user" do
    it 'assigns a user' do
      github_user = Github::User.find("murraycatto")
      expect(github_user.is_a?(Github::User)).to be(true)
    end
  end

  context "Setup user repos" do
    it 'sets the github users repos' do
      github_user = Github::User.find("murraycatto")
      expect(github_user.repos).to eq(nil)
      github_user.set_repos
      expect(github_user.repos).to_not eq(nil)
    end
  end

  context "Calcualte users favorite language" do
    it 'sets the github users repos' do
      github_user = Github::User.find("ruby")
      github_user.set_repos
      # https://github.com/ruby
      expect(github_user.fav_language).to eq(nil)
      github_user.calc_fav_lang
      expect(github_user.fav_language).to_not eq(nil)
      expect(github_user.fav_language).to eq("Ruby")
    end
  end

end
