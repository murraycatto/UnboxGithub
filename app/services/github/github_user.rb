module Github
  class User
    attr_accessor :username,
                  :name,
                  :location,
                  :public_repos,
                  :followers,
                  :following,
                  :id,
                  :avatar_url,
                  :image,
                  :score,
                  :repos,
                  :fav_language

    def initialize(args)
      self.username = args["login"]
      self.id = args["id"]
      self.avatar_url = args["avatar_url"]
      self.score = args["score"]
      self.name = args["name"] if args["name"]
      self.location = args["location"] if args["location"]
      self.followers = args["followers"] if args["followers"]
      self.following = args["following"] if args["following"]
      self.public_repos = args["public_repos"] if args["public_repos"]
    end

    def self.search(username)
      github_users = []
      response = API.search_users(username)
      if response["items"]
        response["items"].each do |github_user_json|
          github_users.push(User.new(github_user_json))
        end
      end
      github_users
    end

    def self.find(username)
      User.new(API.get_user(username,"a3663095f4dd4ec10ffe95a46c0a4e776eb0f389"))
    end

    def set_repos
      github_user_repos = []
      API.get_repos(self.username,"a3663095f4dd4ec10ffe95a46c0a4e776eb0f389").each do |github_repo_json|
        github_user_repos.push(UserRepo.new(github_repo_json))
      end
      self.repos = github_user_repos
    end

    def calc_fav_lang
      languages = []
      self.repos.each do |repo|
        languages.push(repo.language)
      end
      self.fav_language = languages.uniq.max_by{ |i| languages.count( i ) }
    end

  end
end
