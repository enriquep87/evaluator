Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  root :to => "students#index"
  # Routes for the Class_comment resource:
  # CREATE
  get "/class_comments/new", :controller => "class_comments", :action => "new"
  post "/create_class_comment", :controller => "class_comments", :action => "create"

  # READ
  get "/class_comments", :controller => "class_comments", :action => "index"
  get "/class_comments/:id", :controller => "class_comments", :action => "show"

  # UPDATE
  get "/class_comments/:id/edit", :controller => "class_comments", :action => "edit"
  post "/update_class_comment/:id", :controller => "class_comments", :action => "update"

  # DELETE
  get "/delete_class_comment/:id", :controller => "class_comments", :action => "destroy"
  #------------------------------

  # Routes for the Class_member resource:
  # CREATE
  get "/class_members/new", :controller => "class_members", :action => "new"
  post "/create_class_member", :controller => "class_members", :action => "create"

  # READ
  get "/class_members", :controller => "class_members", :action => "index"
  get "/class_members/:id", :controller => "class_members", :action => "show"

  # UPDATE
  get "/class_members/:id/edit", :controller => "class_members", :action => "edit"
  post "/update_class_member/:id", :controller => "class_members", :action => "update"

  # DELETE
  get "/delete_class_member/:id", :controller => "class_members", :action => "destroy"
  #------------------------------

  # Routes for the Professor resource:
  # CREATE
  get "/professors/new", :controller => "professors", :action => "new"
  post "/create_professor", :controller => "professors", :action => "create"

  # READ
  get "/professors", :controller => "professors", :action => "index"
  get "/professors/:id", :controller => "professors", :action => "show"

  # UPDATE
  get "/professors/:id/edit", :controller => "professors", :action => "edit"
  post "/update_professor/:id", :controller => "professors", :action => "update"

  # DELETE
  get "/delete_professor/:id", :controller => "professors", :action => "destroy"
  #------------------------------
  devise_for :users
  # Routes for the User resource:
  # CREATE
  get "/users/new", :controller => "users", :action => "new"
#  post "/create_user", :controller => "users", :action => "create"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
#  get "/users/:id/edit", :controller => "users", :action => "edit"
#  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
#  get "/delete_user/:id", :controller => "users", :action => "destroy"
  #------------------------------

  # Routes for the Course resource:
  # CREATE
  get "/courses/new", :controller => "courses", :action => "new"
  post "/create_course", :controller => "courses", :action => "create"

  # READ
  get "/courses", :controller => "courses", :action => "index"
  get "/courses/:id", :controller => "courses", :action => "show"

  # UPDATE
  get "/courses/:id/edit", :controller => "courses", :action => "edit"
  post "/update_course/:id", :controller => "courses", :action => "update"

  # DELETE
  get "/delete_course/:id", :controller => "courses", :action => "destroy"
  #------------------------------

  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  get "/reviews/myopinion", :controller => "reviews", :action => "opinion"
  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------


  # Routes for the Student resource:
  # CREATE
  get "/students/new", :controller => "students", :action => "new"
  post "/create_student", :controller => "students", :action => "create"

  # READ
  get "/students", :controller => "students", :action => "index"
  get "/students/:id", :controller => "students", :action => "show"

  # UPDATE
  get "/students/:id/edit", :controller => "students", :action => "edit"
  post "/update_student/:id", :controller => "students", :action => "update"

  # DELETE
  get "/delete_student/:id", :controller => "students", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
