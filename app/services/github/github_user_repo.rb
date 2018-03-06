module Github
  class UserRepo
    attr_accessor :name,
                  :id,
                  :language,
                  :image,
                  :score,
                  :repos

    def initialize(args)
      self.name = args["name"]
      self.id = args["id"]
      self.language = args["language"]
      self.score = args["score"]
    end

  end
end
