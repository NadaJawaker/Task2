module SubmissionHelper

  def fun(submission)
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    file = "/home/nada/railsProjects/task2/paths/"+path.to_s+".rb"
   logger.info system("touch #{file}")
   logger.info system("echo \'#{submission.code}\' >> #{file}")
    res= `ruby #{file}`
   res
  end

end
