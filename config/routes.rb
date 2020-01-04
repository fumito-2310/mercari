Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  #   registrations: 'users/registrations' }
  
    get '/auth/facebook/callback', to: 'facebook#auth_done'

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

   get 'users' => 'users#identification'
   get 'top' => 'top#index'
   get 'users' => 'users#logout'

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
      post 'create'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end

  root 'items#index'
  resources :users
  resources :items, only: [:index, :show, :new, :edit, :destroy, :create] do

    get  'purchase/:id'=>  'items#purchase', as: 'purchase'
    post 'pay/:id'=>   'items#pay', as: 'pay'#httpメソッドはpostなので注意
    get  'done'=>      'items#done', as: 'done'

    resources :comments, only: [:create]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
 
end
