class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"  
    else
      # @prototype = @comment.prototype
      @comments = @prototype.comments
      render :"prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
# prototype_path