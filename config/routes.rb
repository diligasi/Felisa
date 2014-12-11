Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get 'manager/index'
  get 'manager/guests'

  resources :guests
  resources :sessions, only: [:new, :create, :destroy, :index]

  #get 'static_page/index'
  get '/cerimonia'        =>  'static_page#ceremony',       :as =>  :ceremony
  get '/lista_presentes'  =>  'static_page#gift_list',      :as =>  :gift_list
  get '/depoimentos'      =>  'static_page#testimonials',   :as =>  :testimonials
  get '/historia_casal'   =>  'static_page#couple_history', :as =>  :couple_history
  get '/fornecedores'     =>  'static_page#suppliers',      :as =>  :suppliers
  get '/gerenciamento'    =>  'manager#index',              :as =>  :manager

  match '/savar_depoimentos'        =>  'static_page#create_testimonial',        via: 'post',          :as =>  :save_testimonials
  match '/acesso'                   =>  'sessions#new',                         via:  'get',          :as =>  :login
  match '/upload'                   =>  'manager#guests',                       via:  'post',         :as =>  :upload
  match '/texto_nossa_historia'     =>  'manager#save_couple_history_content',  via:  %w(PATCH post), :as =>  :save_couple_history_content
  match '/sair'                     =>  'sessions#destroy',                     via:  'delete',       :as =>  :signout
  match '/confirmar'                =>  'guests#confirm',                       via:  %w(get post),   :as =>  :confirmation
  match '/guest_autocomplete_list'  =>  'guests#guest_autocomplete_list',       via:  %w(get post)

  root 'static_page#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
