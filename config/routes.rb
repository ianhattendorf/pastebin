Rails.application.routes.draw do
  root 'pastes#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :pastes, only: [:index, :show, :create, :edit, :update, :destroy]
  get 'pastes/:id/download' => 'pastes#download', as: :download
  get 'pastes/:id/raw' => 'pastes#raw', as: :raw
end
