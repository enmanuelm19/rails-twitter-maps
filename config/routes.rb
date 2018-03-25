Rails.application.routes.draw do
  resources :videos
  get 'pages/contact'

  get 'pages/about'

   root 'videos#index'

end
