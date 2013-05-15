BareboneRails::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  get "pages/index"

end
