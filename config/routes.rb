Rails.application.routes.draw do

  get '/', to: 'welcome#show'
  get 'welcome/', to: 'welcome#show'
  get 'welcome/:id/', to: 'welcome#show'
  get 'contact/', to: 'contact#show'
  get 'team/', to: 'team#show'
  get 'message/show'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gossips do
  resources :comments
  resources :likes
  end
  resources :author
  resources :city
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
