module Github
  class User
    attr_accessor :username,
                  :id,
                  :avatar_url,
                  :image,
                  :score,
                  :repos

    def initialize(args)
      self.username = args["login"]
      self.id = args["id"]
      self.avatar_url = args["avatar_url"]
      self.score = args["score"]
    end

    def self.search(username)
      github_users = []
      API.get_user(username)["items"].each do |github_user_json|
        github_users.push(User.new(github_user_json))
      end
      github_users
    end

    def set_repos
      github_user_repos = []
      API.get_repos("murraycatto").each do |github_repo_json|
        github_user_repos.push(UserRepo.new(github_repo_json))
      end
      self.repos = github_user_repos
    end

  end
end
