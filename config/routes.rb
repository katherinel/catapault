Catapault::Application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :breeds, except: [:new, :edit] do
        collection do
          get :stats, resource: 'Breed', to: "stats#index"
        end
      end
      resources :tags, except: [:new, :edit] do
        collection do
          get :stats, resource: 'Tag', to: "stats#index"
        end
      end
    end
  end
end
