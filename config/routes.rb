GenericResources::Engine.routes.draw do

  namespace :generic_resources do

    resources :resources, only: [] do
      collection do
        get :all
      end
    end

    scope ":resource_name" do
      resources :resources
    end
  end

end