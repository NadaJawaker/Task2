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
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    errorEnd = (0...50).map { rdm[rand(rdm.length)] }.join

    @submission.code = <<-CODE
      begin
        #{@submission.code}
      rescue Exception => e
        puts e.class.to_s + \" #{errorEnd}\"
      end
    CODE

    @submission.output = helpers.fun(@submission)
    tmp = @submission.output.split(' ').last
    if tmp != errorEnd.to_s
      @submission.status = "Code has run successfully :)"
    else
      @submission.status = @submission.output.split(' ').first
      @submission.output = "No output, there's an error :("
    end
   
    @submission.code = helpers.toOriginalCode(@submission)

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

  private
  def submission_params
    params.require(:submission).permit(:code, :input)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

end
