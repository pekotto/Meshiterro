
Rails.application.routes.draw do

  devise_for :users
  # ログイン後、自動で投稿一覧ページへルーティング
  root 'post_images#index'
  # 新規投稿、一覧、詳細機能にのみルーティング
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  # コメント機能はpost_imageと親子関係（親：post_image, 子：comment） なので、post_imagesのresourcesボックスに入れる
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html