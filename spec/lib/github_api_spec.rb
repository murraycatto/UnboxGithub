require 'rails_helper'
require File.expand_path('../../../lib/github/github.rb', __FILE__)

describe 'Github API request' do
  it 'returns a list of users' do
    response = GithubAPI.get_user("murraycatto")
    expect(response["total_count"]).to be > 0
    expect(response["items"].is_a?(Array)).to eq(true)
  end

  it 'returns a list of repos' do
    response = GithubAPI.get_repos("murraycatto")
    expect(response.is_a?(String)).to eq(false)
    expect(response.is_a?(Array)).to eq(true)
    expect(response.count).to be > 0
  end
end
