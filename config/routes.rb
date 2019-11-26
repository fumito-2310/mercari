Rails.application.routes.draw do
  get 'card/new'

  get 'card/show'

  get 'cards/new' => 'cards#new'
  get 'cards/show'

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  #   registrations: 'users/registrations' }
    get '/auth/facebook/callback', to: 'facebook#auth_done'


   get 'top' => 'top#index'


   def after_sign_out_path_for(resource)
    new_user_session_path
   end

  resources :signup do
    collection do
      get 'step0_1'
      get 'step0_2'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      post 'create'
      get 'done' # 登録完了後のページ
    end
  end
  root 'items#index'
  resources :users
  resources :items

  # root to: 'signup#step4'  
  # devise_for :users
  # root  'users#index'

  # resources :signup do
  #   collection do
  #     get 'step1'
  #     get 'step2'
  #     get 'step3'
  #     get 'step4' # ここで、入力の全てが終了する
  #     post 'create'
  #     get 'done' # 登録完了後のページ
  #   end
  # end
end
