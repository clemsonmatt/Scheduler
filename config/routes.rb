Rails.application.routes.draw do

    resources :schedule,
        :timesheet,
        :request

    get '/manage/person', to: 'manage/person#index', as: 'manage_person_index'

    # person profile
    get '/manage/person/:id/profile', to: 'manage/person/profile#show', as: 'manage_person_profile'
    get '/manage/person/new', to: 'manage/person/profile#new', as: 'new_manage_person_profile'
    get '/manage/person/:id/edit', to: 'manage/person/profile#edit', as: 'edit_manage_person_profile'
    post '/manage/person', to: 'manage/person/profile#create'
    patch '/manage/person/:id', to: 'manage/person/profile#update'

    # person availability
    get '/manage/person/:id/availability', to: 'manage/person/availability#show', as: 'manage_person_availability'
    get '/manage/person/:id/availability/:day/new', to: 'manage/person/availability#new', as: 'new_manage_person_availability'
    post '/manage/person/:id/availability', to: 'manage/person/availability#create'
    delete 'manage/person/:id/availability/:availability_id', to: 'manage/person/availability#destroy', as: 'delete_manage_person_availability'

    # namespace :manage do
        # get '/person', to: 'person#index', as: 'person_index'
        #
        # get '/person/:id/profile', to: 'person/profile#show', as: 'person_profile'
        # get '/person/new', to: 'person/profile#new', as: 'new_person_profile'
        # get '/person/:id/edit', to: 'person/profile#edit', as: 'edit_person_profile'
        # resources :person
        # namespace :person do
        #     resources :profile,
        #         :availability
        # end
    # end

    # session
    get 'login', to: 'session#new', as: 'login'
    get 'logout', to: 'session#destroy', as: 'logout'
end
