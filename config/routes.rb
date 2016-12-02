Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "students#index"
  # Routes for the Session_comment resource:
  # CREATE
  get "/session_comments/new", :controller => "session_comments", :action => "new"
  post "/create_session_comment", :controller => "session_comments", :action => "create"

  # READ
  get "/session_comments", :controller => "session_comments", :action => "index"
  get "/session_comments/:id", :controller => "session_comments", :action => "show"

  # UPDATE
  get "/session_comments/:id/edit", :controller => "session_comments", :action => "edit"
  post "/update_session_comment/:id", :controller => "session_comments", :action => "update"

  # DELETE
  get "/delete_session_comment/:id", :controller => "session_comments", :action => "destroy"
  #------------------------------

  # Routes for the Course_member resource:
  # CREATE
  get "/course_members/new", :controller => "course_members", :action => "new"
  post "/create_course_member", :controller => "course_members", :action => "create"

  # READ
  get "/course_members", :controller => "course_members", :action => "index"
  get "/course_members/:id", :controller => "course_members", :action => "show"

  # UPDATE
  get "/course_members/:id/edit", :controller => "course_members", :action => "edit"
  post "/update_course_member/:id", :controller => "course_members", :action => "update"

  # DELETE
  get "/delete_course_member/:id", :controller => "course_members", :action => "destroy"
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

  # Routes for the User resource:
  # CREATE
  get "/users/new", :controller => "users", :action => "new"
  post "/create_user", :controller => "users", :action => "create"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  get "/users/:id/edit", :controller => "users", :action => "edit"
  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  get "/delete_user/:id", :controller => "users", :action => "destroy"
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
