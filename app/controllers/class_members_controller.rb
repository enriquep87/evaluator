class ClassMembersController < ApplicationController
  def index
    @class_members = ClassMember.page(params[:page]).per(10)

    render("class_members/index.html.erb")
  end

  def show
    @review = Review.new
    @class_comment = ClassComment.new
    @class_member = ClassMember.find(params[:id])

    render("class_members/show.html.erb")
  end

  def new
    @class_member = ClassMember.new

    render("class_members/new.html.erb")
  end

  def create
    @class_member = ClassMember.new

    @class_member.student_id = params[:student_id]
    @class_member.class_id = params[:class_id]

    save_status = @class_member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/class_members/new", "/create_class_member"
        redirect_to("/class_members")
      else
        redirect_back(:fallback_location => "/", :notice => "Class member created successfully.")
      end
    else
      render("class_members/new.html.erb")
    end
  end

  def edit
    @class_member = ClassMember.find(params[:id])

    render("class_members/edit.html.erb")
  end

  def update
    @class_member = ClassMember.find(params[:id])

    @class_member.student_id = params[:student_id]
    @class_member.class_id = params[:class_id]

    save_status = @class_member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/class_members/#{@class_member.id}/edit", "/update_class_member"
        redirect_to("/class_members/#{@class_member.id}", :notice => "Class member updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Class member updated successfully.")
      end
    else
      render("class_members/edit.html.erb")
    end
  end

  def destroy
    @class_member = ClassMember.find(params[:id])

    @class_member.destroy

    if URI(request.referer).path == "/class_members/#{@class_member.id}"
      redirect_to("/", :notice => "Class member deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Class member deleted.")
    end
  end
end
