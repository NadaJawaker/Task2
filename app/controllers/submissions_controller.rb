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
        #@sub["output"]
	#@submission = fun(@submission)
	@submission.output = helpers.fun(@submission)

	if @submission.save

	flash[:success] = "Your code was successfully submitted"

	redirect_to submission_path(@submission)

	else

	render 'new'

	end

	end


	def show
	@submission = Submission.new
	end


end

private

def submission_params

params.require(:submission).permit(:code, :input)

end

def set_submission

@submission = Submission.find(params[:id])

end




