class SubmissionsController < ApplicationController

	def index
	@submissions = Submission.all
	end

	def new
	@submission = Submission.new
	end

	def create

	@submission = Submission.new(submission_params)
	@submission.user = current_user
	@submission.output = helpers.fun(@submission)[0]
        #@submission.status= helpers.fun(@submission)[1]
	if helpers.fun(@submission)[1] == false
        @submission.status= "Something went wrong :("
	else
	@submission.status= "Code run successfully :)"
	end

	if @submission.save

	flash[:success] = "Your code was successfully submitted"

        redirect_to user_path(@submission.user)

	else

	render 'new'

	end

	end


	def show
	@submission = Submission.find(params[:id])
	end


end

private

def submission_params

params.require(:submission).permit(:code, :input)

end

def set_submission

@submission = Submission.find(params[:id])

end




