Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1, path: 'v1' do
      devise_for :users,
        defaults: { format: :json },
        path: '',
        path_names: {
          sign_in: 'login',
          sign_out: 'logout',
          registration: 'signup'
        },
        controllers: {
          sessions: 'api/v1/sessions',
          registrations: 'api/v1/registrations'
        }

      resources :products, only: :index
      resources :favorite_products, only: [:index, :create, :destroy]
    end
  end
end
