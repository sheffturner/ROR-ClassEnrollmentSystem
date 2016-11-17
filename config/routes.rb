Rails.application.routes.draw do

  get 'studentcourses/coursesout'
  
  get 'enrollsearch', to: 'studentcourses#studentnamein', as: 'enrollsearch'
  
  post 'studentcourses/coursesout'
  
  post 'studentcourses/studentnamein'

  get 'enrollments/index'

  get 'enrollment/index'

  resources :enrollments
  resources :courses
  resources :admins
  get 'adminhome', to: 'admins#index', as: 'adminhome'
  get 'adminlist', to: 'admins#adminlist', as: 'adminlist'
  get 'newadmin', to: 'admins#new', as: 'newadmin'
  
  resources :sessions, only:[:new, :new1, :create, :destroy]
  resources :adminsessions, only:[:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to:'sessions#new', as: 'login'
  get 'login2', to: 'sessions#new1', as: 'login2'
  get 'adminlogin', to: 'adminsessions#new', as: 'adminlogin'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'newcourse', to: 'courses#new', as: 'newcourse'
  get 'userhome', to: 'users#index', as: 'userhome'
  get 'userlist', to: 'users#userlist', as: 'userlist'
  get 'coursebymajor', to: 'courses#coursebymajor', as: 'coursebymajor'
  get '/users/:id/classregis', to: 'users#classregis', as: 'classregis'
  get 'love', to: 'student_enrollments#classregis', as: 'love'
  get 'enroll', to: 'enrollments#index', as: 'enroll'
  post "users/classregis"

  resources :users do
    member do
      patch :update_number_two
      put :update_number_two
    end
  end
  get 'home', to:'landing_page#index', as: 'home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landing_page#index'

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
