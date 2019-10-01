Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get 'oasis-center-arena' => 'contact_us#index', as: "contact_us"
  get 'aeon-mall-jakarta-garden-city' => 'tenants#index', as: "tenants"
  get 'official-hotel' => 'hotels#index', as: "hotels"
  get 'info-jakarta' => 'informations#index', as: "informations"
  resources :downloads, only: [:index]

  get    '/login' => 'session#new', as: "login"
  post   '/login' => 'session#create', as: "login_create"
  delete '/logout' => 'session#destroy', as: "logout"

  get "admin" => "admin/dashboard#index", as: "admin"
  namespace :admin do
    resources :banners
    resources :downloads
    resources :hotels do
      member do
        resources :hotel_images, except: [:index], param: :hotel_image_id
      end
    end
    resources :tenants do
      member do
        resources :tenant_images, except: [:index], param: :tenant_image_id
      end
    end
    resources :pages
    resources :places
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
