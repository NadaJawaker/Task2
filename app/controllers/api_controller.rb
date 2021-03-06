class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:test]

  def test
    @submission = SubmissionRun.new
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    errorEnd = (0...50).map { rdm[rand(rdm.length)] }.join
    code = Submission.find(params["code_id"]).code
    @submission.submission_id = Submission.find(params["code_id"]).id
    code = <<-CODE
      begin
        #{code}
      rescue Exception => e
        puts e.class.to_s + \" #{errorEnd}\"
      end
    CODE

    @submission.input= params["input"]
    @submission.output = helpers.funAPI(code, @submission.input)
    tmp = @submission.output.split(' ').last
    if tmp != errorEnd.to_s
      @submission.status = "Code has run successfully :)"
    else
      @submission.status = @submission.output.split(' ').first
      @submission.output = "No output, there's an error :("
    end

    @submission.save

    render :json => @submission.output
  end


end






