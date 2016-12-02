class ProfessorsController < ApplicationController
  def index
    @professors = Professor.page(params[:page]).per(10)

    render("professors/index.html.erb")
  end

  def show
    @course = Course.new
    @professor = Professor.find(params[:id])

    render("professors/show.html.erb")
  end

  def new
    @professor = Professor.new

    render("professors/new.html.erb")
  end

  def create
    @professor = Professor.new

    @professor.name = params[:name]
    @professor.user_id = params[:user_id]
    @professor.last_name = params[:last_name]

    save_status = @professor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/professors/new", "/create_professor"
        redirect_to("/professors")
      else
        redirect_back(:fallback_location => "/", :notice => "Professor created successfully.")
      end
    else
      render("professors/new.html.erb")
    end
  end

  def edit
    @professor = Professor.find(params[:id])

    render("professors/edit.html.erb")
  end

  def update
    @professor = Professor.find(params[:id])

    @professor.name = params[:name]
    @professor.user_id = params[:user_id]
    @professor.last_name = params[:last_name]

    save_status = @professor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/professors/#{@professor.id}/edit", "/update_professor"
        redirect_to("/professors/#{@professor.id}", :notice => "Professor updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Professor updated successfully.")
      end
    else
      render("professors/edit.html.erb")
    end
  end

  def destroy
    @professor = Professor.find(params[:id])

    @professor.destroy

    if URI(request.referer).path == "/professors/#{@professor.id}"
      redirect_to("/", :notice => "Professor deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Professor deleted.")
    end
  end
end
