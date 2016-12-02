class CourseMembersController < ApplicationController
  def index
    @q = CourseMember.ransack(params[:q])
    @course_members = @q.result(:distinct => true).includes(:student, :class, :class_comments, :reviews).page(params[:page]).per(10)

    render("course_members/index.html.erb")
  end

  def show
    @review = Review.new
    @session_comment = SessionComment.new
    @course_member = CourseMember.find(params[:id])

    render("course_members/show.html.erb")
  end

  def new
    @course_member = CourseMember.new

    render("course_members/new.html.erb")
  end

  def create
    @course_member = CourseMember.new

    @course_member.student_id = params[:student_id]
    @course_member.course_id = params[:course_id]

    save_status = @course_member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/course_members/new", "/create_course_member"
        redirect_to("/course_members")
      else
        redirect_back(:fallback_location => "/", :notice => "Course member created successfully.")
      end
    else
      render("course_members/new.html.erb")
    end
  end

  def edit
    @course_member = CourseMember.find(params[:id])

    render("course_members/edit.html.erb")
  end

  def update
    @course_member = CourseMember.find(params[:id])

    @course_member.student_id = params[:student_id]
    @course_member.course_id = params[:course_id]

    save_status = @course_member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/course_members/#{@course_member.id}/edit", "/update_course_member"
        redirect_to("/course_members/#{@course_member.id}", :notice => "Course member updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Course member updated successfully.")
      end
    else
      render("course_members/edit.html.erb")
    end
  end

  def destroy
    @course_member = CourseMember.find(params[:id])

    @course_member.destroy

    if URI(request.referer).path == "/course_members/#{@course_member.id}"
      redirect_to("/", :notice => "Course member deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Course member deleted.")
    end
  end
end
