class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result(:distinct => true).includes(:class_members, :user, :classes).page(params[:page]).per(10)

    render("students/index.html.erb")
  end

  def show
    @class_member = ClassMember.new
    @student = Student.find(params[:id])

    render("students/show.html.erb")
  end

  def new
    @student = Student.new

    render("students/new.html.erb")
  end

  def create
    @student = Student.new

    @student.name = params[:name]
    @student.last_name = params[:last_name]
    @student.mba_class = params[:mba_class]
    @student.photo = params[:photo]
    @student.user_id = params[:user_id]

    save_status = @student.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/students/new", "/create_student"
        redirect_to("/students")
      else
        redirect_back(:fallback_location => "/", :notice => "Student created successfully.")
      end
    else
      render("students/new.html.erb")
    end
  end

  def edit
    @student = Student.find(params[:id])

    render("students/edit.html.erb")
  end

  def update
    @student = Student.find(params[:id])

    @student.name = params[:name]
    @student.last_name = params[:last_name]
    @student.mba_class = params[:mba_class]
    @student.photo = params[:photo]
    @student.user_id = params[:user_id]

    save_status = @student.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/students/#{@student.id}/edit", "/update_student"
        redirect_to("/students/#{@student.id}", :notice => "Student updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Student updated successfully.")
      end
    else
      render("students/edit.html.erb")
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    if URI(request.referer).path == "/students/#{@student.id}"
      redirect_to("/", :notice => "Student deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Student deleted.")
    end
  end
end
