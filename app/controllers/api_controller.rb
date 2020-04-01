class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:test]

  def test
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    errorEnd = (0...50).map { rdm[rand(rdm.length)] }.join
    code = Submission.find(params["codeId"]).code
    
    code = <<-CODE
      begin
        #{code}
      rescue Exception => e
        puts e.class.to_s + \" #{errorEnd}\"
      end
    CODE

    output = helpers.funAPI(code, params["input"])
    tmp = output.split(' ').last
    if tmp != errorEnd.to_s
      status = "Code has run successfully :)"
    else
      status = output.split(' ').first
      output = "No output, there's an error :("
    end
    render json: {output: output, status: status},status: :ok
  end

end
