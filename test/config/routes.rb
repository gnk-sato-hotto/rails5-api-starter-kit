Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :customers
  #resources :users
  #resources :musics

  post 'vision_api/face' => 'vision_api#face'
  resource  :user_sessions, only: [:create, :destroy]
end
