require "#{Rails.root}/lib/github/github_api.rb"
require "#{Rails.root}/app/services/github/github_user_repo.rb"
require "#{Rails.root}/app/services/github/github_user.rb"

class GithubController < ApplicationController

  def search
    @github_users = Github::User.search(params["username"])
    respond_to do |format|
      format.js {render :search, layout: false}
    end
  end

  def show
    @github_user = Github::User.find(params["username"])
    @github_user.set_repos
    @github_user.calc_fav_lang
  end

end
