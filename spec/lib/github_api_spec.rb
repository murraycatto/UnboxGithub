require 'rails_helper'

describe 'Github API request' do
  it 'returns a list of users' do
    response = Github::API.search_users("Murray")
    expect(response["total_count"]).to be > 0
    expect(response["items"].is_a?(Array)).to eq(true)
  end

  it 'returns a user' do
    response = Github::API.get_user("murraycatto")
    expect(response["login"]).to eq("murraycatto")
  end

  it 'returns a list of repos' do
    response = Github::API.get_repos("murraycatto")
    expect(response.is_a?(String)).to eq(false)
    expect(response.is_a?(Array)).to eq(true)
    expect(response.count).to be > 0
  end
end
