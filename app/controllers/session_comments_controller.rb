class SessionCommentsController < ApplicationController
  def index
    @q = SessionComment.ransack(params[:q])
    @session_comments = @q.result(:distinct => true).includes(:class_member, :reviews).page(params[:page]).per(10)

    render("session_comments/index.html.erb")
  end

  def show
    @review = Review.new
    @session_comment = SessionComment.find(params[:id])

    render("session_comments/show.html.erb")
  end

  def new
    @session_comment = SessionComment.new

    render("session_comments/new.html.erb")
  end

  def create
    @session_comment = SessionComment.new

    @session_comment.course_member_id = params[:course_member_id]
    @session_comment.summary = params[:summary]
    @session_comment.body = params[:body]

    save_status = @session_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/session_comments/new", "/create_session_comment"
        redirect_to("/session_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Session comment created successfully.")
      end
    else
      render("session_comments/new.html.erb")
    end
  end

  def edit
    @session_comment = SessionComment.find(params[:id])

    render("session_comments/edit.html.erb")
  end

  def update
    @session_comment = SessionComment.find(params[:id])

    @session_comment.course_member_id = params[:course_member_id]
    @session_comment.summary = params[:summary]
    @session_comment.body = params[:body]

    save_status = @session_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/session_comments/#{@session_comment.id}/edit", "/update_session_comment"
        redirect_to("/session_comments/#{@session_comment.id}", :notice => "Session comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Session comment updated successfully.")
      end
    else
      render("session_comments/edit.html.erb")
    end
  end

  def destroy
    @session_comment = SessionComment.find(params[:id])

    @session_comment.destroy

    if URI(request.referer).path == "/session_comments/#{@session_comment.id}"
      redirect_to("/", :notice => "Session comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Session comment deleted.")
    end
  end
end
