class CommentsController < ApplicationController

def new

@comment = Comment.new

end


def create

@comment = Comment.new(article_params)

@comment.user = current_user

if @comment.save

flash[:success] = "Comment published successfully"

redirect_to article_path(@article)

else

render 'new'

end

end

end



private

def set_comment

@comment = comment.find(params[:id])

end

def comment_params

params.require(:comment).permit(:content)

end

def require_same_user

if current_user != @comment.user

flash[:danger] = "You can only edit or delete your own comment"

redirect_to root_path

end

end

end
