Rails.application.routes.draw do
  root to: "home#index"
  post "/search", to: "github#search"
  get "/github_user/:username", to: "github#show", as: "github_user"
end
