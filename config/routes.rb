Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get 'manager/index'
  get 'manager/guests'

  resources :guests
  resources :sessions, only: [:new, :create, :destroy, :index]

  #get 'static_page/index'
  get '/cerimonia'        =>  'static_page#ceremony',       :as =>  :ceremony
  get '/listaPresentes'   =>  'static_page#gift_list',      :as =>  :gift_list
  get '/depoimentos'      =>  'static_page#testimonials',   :as =>  :testimonials
  get '/historiaCasal'    =>  'static_page#couple_history', :as =>  :couple_history
  get '/fornecedores'     =>  'static_page#suppliers',      :as =>  :suppliers
  get '/pessoasEspeciais' =>  'static_page#main_people',    :as =>  :main_people
  get '/gerenciamento'    =>  'manager#index',              :as =>  :manager

  match '/savarDepoimentos'       =>  'static_page#create_testimonial',       via: 'post',          :as =>  :save_testimonials
  match '/acesso'                 =>  'sessions#new',                         via:  'get',          :as =>  :login
  match '/upload'                 =>  'manager#guests',                       via:  'post',         :as =>  :upload
  match '/textoNossaHistoria'     =>  'manager#save_couple_history_content',  via:  %w(PATCH post), :as =>  :save_couple_history_content
  # match '/textoNossasPais'        =>  'manager#save_parents_history_content', via:  %w(PATCH post), :as =>  :save_main_people_content
  match '/textoNossasPais'        =>  'manager#save_main_people_content',     via:  %w(PATCH post), :as =>  :save_main_people_content
  match '/sair'                   =>  'sessions#destroy',                     via:  'delete',       :as =>  :signout
  # match '/confirmar'              =>  'guests#confirm',                       via:  %w(get post),   :as =>  :confirmation
  match '/guestAutocompleteList'  =>  'guests#guest_autocomplete_list',       via:  %w(get post)
  match '/selectGuest'            =>  'guests#select_guest',                  via:  %w(get post)
  match '/confirmThisGuest'       =>  'guests#confirm_this_guest',            via:  'post'

  root 'static_page#index'
end
