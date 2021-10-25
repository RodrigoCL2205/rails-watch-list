Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, except: [:update, :edit] do
    resources :bookmarks, except:[:update, :edit, :index, :destroy]

    resources :reviews, except: [:update, :edit, :index, :destroy]
  end
  resources :bookmarks, only: :destroy

  root to: 'lists#index'
end
