Rails.application.routes.draw do
  # confirmの追加
  get '/confirm/:id', to: 'posts#confirm', as: :confirm
  # only以下追記
  resources :posts
  # トップページにアクセスした際に postコントローラのnewアクションを呼び出す設定

  root 'posts#new'
  get '/homes', to: 'homes#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'homes#login'
end