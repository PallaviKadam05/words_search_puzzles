Rails.application.routes.draw do
  resources :histories
  devise_for :users #,  :controllers => {omniauth_callbacks: "callbacks"}


  scope "/admin" do
  resources :users
end
   get 'words/index'
    #post 'histories/'

   post 'histories/create'
  # get 'histories/save_data'
  get 'words/high_scores'
   get 'words/fetch_words'
  resources :words
  resources :users
  root to: "words#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
