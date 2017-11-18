Rails.application.routes.draw do
  namespace :api do

    resources :members do
      post :login, :register, on: :collection
    end

  end
end