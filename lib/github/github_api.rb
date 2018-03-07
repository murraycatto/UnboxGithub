module Github

  require 'faraday'
  require 'json'
  class API
    BASE = 'https://api.github.com'

    def self.search_users(username)
      JSON.parse(self.api.get("search/users?q=#{username}").body)
    end

    def self.get_user(username,access_token = "")
      JSON.parse(self.api.get("users/#{username}?access_token=#{access_token}").body)
    end

    def self.get_repos(username,access_token = "")
      JSON.parse(self.api.get("users/#{username}/repos?access_token=#{access_token}").body)
    end

    def self.api
      Faraday.new(url: BASE) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = 'application/json'
      end
    end
  end
end
