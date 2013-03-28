Ngkub::Application.routes.draw do
   
  mount Ckeditor::Engine => '/ckeditor'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match '/adminka/comments' => 'adminka#comments'
  devise_for :users
  resources :publications, :path => "news"
  get '/archive' => 'publications#archive'

  resources :pages, :path => "info"

  resources :users, :categories, :adminka, :teles, :heros, 
            :interviews, :comments, :answers, :questions, 
            :banners, :complaints, :posts

  root :to => "pages#indexpage"

  match '/search/' => 'search#index'


end
