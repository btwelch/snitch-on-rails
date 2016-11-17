Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/servers/snitch", to: 'servers#snitch'
  get "/servers", to: 'servers#index'

  post "/servers/assign_person", to: 'servers#assign_person'

  delete "/servers/delete_server", to: 'servers#delete_server'
  delete "/servers/delete_repo", to: 'servers#delete_repo'
end
