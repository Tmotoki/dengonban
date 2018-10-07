Rails.application.routes.draw do
  get 'dengonban', to: "dengonban#index"
  post 'dengonban', to: 'dengonban#index'
  get 'dengonban/index'

  get 'hello/index'
  post "hello/index"
  get 'hello/other'
  get 'hello', to:'hello#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
