require 'rails_helper'
require File.expand_path('../../../lib/github/github_api.rb', __FILE__)
require File.expand_path('../../../app/services/github/github_user.rb', __FILE__)

describe 'Github User' do
  it 'assigns an array of users' do
    github_users = Github::User.search("murraycatto")
  end

  it 'sets the github users repos' do
    github_user = Github::User.search("murraycatto").first
    expect(github_user.repos).to eq(nil)
    github_user.set_repos
    expect(github_user.repos).to_not eq(nil)
  end
  
end
