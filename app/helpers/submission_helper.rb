module SubmissionHelper

  def fun(submission)
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    file1 = "/home/nada/railsProjects/task2/paths/"+path.to_s+".rb"
    logger.info system("touch #{file1}")
    logger.info system("echo \'#{submission.code}\' >> #{file1}")

    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    file2 = "/home/nada/railsProjects/task2/paths/"+path.to_s
    logger.info system("touch #{file2}")
    logger.info system("echo \'#{submission.input}\' >> #{file2}")

    res= `timeout 5s ruby #{file1} < #{file2}`
   # exit_code = system("timeout 5s ruby #{file1} < #{file2}")
    

    `rm #{file1}`
    `rm #{file2}`
   return res#, exit_code
  end

end
