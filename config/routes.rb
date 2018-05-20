Rails.application.routes.draw do
  get 'classfied_lists/index'

  root 'pages#home'

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show] do
    member do
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'
    end
  end

  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'lifestyles'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
    resources :calendars
  end

  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]
  
   scope '/admin' do
    resources :packages do
      resources :amenities
    end
    resources :classfied_lists
    resources :articles
    resources :rooms, controller: :admin_rooms
   end

  get '/log-room-visit' => 'rooms#log'

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'

  get 'search' => 'pages#search'

  # ------- AirKong -------
  get 'dashboard' => 'dashboards#index'

  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve' => "reservations#approve"
      post '/decline' => "reservations#decline"
    end
  end

  resources :revenues, only: [:index]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :agency_roles
  resources :agents
  resources :page_views, only: [:index]
  resources :agencies

  post '/region/search' => "region#search", defaults: { format: :js }

  get '/host_calendar' => "calendars#host"
  get '/payment_method' => "users#payment"
  get '/payout_method' => "users#payout"
  post '/add_card' => "users#add_card"

  get '/notification_settings' => 'settings#edit'
  post '/notification_settings' => 'settings#update'
  get '/notifications' => 'notifications#index'

  mount ActionCable.server => '/cable'
end
