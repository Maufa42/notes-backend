Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do
  namespace :v1 do 
    resources :notebooks,  only: [:index, :show,:update,:destroy] do
      resources :notes, only: [:index, :show,:update,:destroy]
    end
  end
end


end
