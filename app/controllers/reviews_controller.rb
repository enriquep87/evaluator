class ReviewsController < ApplicationController
  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:class_member, :class_comment).page(params[:page]).per(10)

    render("reviews/index.html.erb")
  end

  def show
    @review = Review.find(params[:id])

    render("reviews/show.html.erb")
  end

  def opinion
    @student = Student.find_by(:user_id => current_user.id)
    @class_member = ClassMember.find_by(:student_id => @student.id)
    @opinion = Review.where(:class_member_id => @class_member.id)

    render("reviews/my_opinion.html.erb")

  end

  def new
    @review = Review.new

    render("reviews/new.html.erb")
  end

  def create
    @review = Review.new

    @review.class_comment_id = params[:class_comment_id]
    @review.class_member_id = params[:class_member_id]
    @review.rating = params[:rating]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/new", "/create_review"
        redirect_to("/reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Review created successfully.")
      end
    else
      render("reviews/new.html.erb")
    end
  end

  def edit
    @review = Review.find(params[:id])

    render("reviews/edit.html.erb")
  end

  def update
    @review = Review.find(params[:id])

    @review.class_comment_id = params[:class_comment_id]
    @review.class_member_id = params[:class_member_id]
    @review.rating = params[:rating]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/#{@review.id}/edit", "/update_review"
        redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review updated successfully.")
      end
    else
      render("reviews/edit.html.erb")
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    if URI(request.referer).path == "/reviews/#{@review.id}"
      redirect_to("/", :notice => "Review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review deleted.")
    end
  end
end
