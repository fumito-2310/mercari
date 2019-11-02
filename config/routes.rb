Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  #   registrations: 'users/registrations' }
  
    get '/auth/facebook/callback', to: 'facebook#auth_done'


  root to: 'top#index' 
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
end
