class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_root, only: [:index, :new, :create]
  before_action :user_params, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    
  end

  
  def create
    @prototype = Prototype.new(message_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
  end

  def update
    # @prototype = Prototype.find(params[:id])
    @prototype.update(message_params)
    if @prototype.save
      redirect_to prototype_path
    else
      render :new
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def user_params
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user == @prototype.user
  end

  def redirect_root
    redirect_to user_session_path unless user_signed_in?
  end
end

