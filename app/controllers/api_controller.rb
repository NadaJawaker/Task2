class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:test]

  def test
    @submission = Submission.new
    @submission.user = User.find(5)
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    errorEnd = (0...50).map { rdm[rand(rdm.length)] }.join
    @submission.code = Submission.find(params["code_id"]).code
    @submission.code = <<-CODE
      begin
        #{@submission.code}
      rescue Exception => e
        puts e.class.to_s + \" #{errorEnd}\"
      end
    CODE

    @submission.input= params["input"]
    @submission.output = helpers.funAPI(@submission.code, @submission.input)
    tmp = @submission.output.split(' ').last
    if tmp != errorEnd.to_s
      @submission.status = "Code has run successfully :)"
    else
      @submission.status = @submission.output.split(' ').first
      @submission.output = "No output, there's an error :("
    end

    @submission.code = helpers.toOriginalCode(@submission)
    @submission.save

    render json: {output: @submission.output, status: @submission.status},status: :ok
  end


end






