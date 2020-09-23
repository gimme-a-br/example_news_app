Rails.application.routes.draw do
  namespace :api do
    get "/articles" => "articles#index"
  end
end
