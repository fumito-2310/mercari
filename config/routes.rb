Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items

  # root to: 'signup#step1'  # devise_for :users
  # # root  'users#index'

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
