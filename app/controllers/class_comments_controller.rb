class ClassCommentsController < ApplicationController
  def index
    @class_comments = ClassComment.all

    render("class_comments/index.html.erb")
  end

  def show
    @class_comment = ClassComment.find(params[:id])

    render("class_comments/show.html.erb")
  end

  def new
    @class_comment = ClassComment.new

    render("class_comments/new.html.erb")
  end

  def create
    @class_comment = ClassComment.new

    @class_comment.class_member_id = params[:class_member_id]
    @class_comment.summary = params[:summary]
    @class_comment.body = params[:body]

    save_status = @class_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/class_comments/new", "/create_class_comment"
        redirect_to("/class_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Class comment created successfully.")
      end
    else
      render("class_comments/new.html.erb")
    end
  end

  def edit
    @class_comment = ClassComment.find(params[:id])

    render("class_comments/edit.html.erb")
  end

  def update
    @class_comment = ClassComment.find(params[:id])

    @class_comment.class_member_id = params[:class_member_id]
    @class_comment.summary = params[:summary]
    @class_comment.body = params[:body]

    save_status = @class_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/class_comments/#{@class_comment.id}/edit", "/update_class_comment"
        redirect_to("/class_comments/#{@class_comment.id}", :notice => "Class comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Class comment updated successfully.")
      end
    else
      render("class_comments/edit.html.erb")
    end
  end

  def destroy
    @class_comment = ClassComment.find(params[:id])

    @class_comment.destroy

    if URI(request.referer).path == "/class_comments/#{@class_comment.id}"
      redirect_to("/", :notice => "Class comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Class comment deleted.")
    end
  end
end
