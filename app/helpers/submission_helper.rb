module SubmissionHelper
  def fun(submission)
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    code_path = "#{Rails.root.to_s}/paths/#{path.to_s}.rb"

    File.write(code_path, submission.code)

    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    input_path = "#{Rails.root.to_s}/paths/#{path.to_s}"

    File.write(input_path, submission.input)

    res = `timeout 2s ruby #{code_path} < #{input_path}`

    `rm #{code_path}`
    `rm #{input_path}`
    res
  end

  def toOriginalCode(submission)
   lines = submission.code.split(/\n/)
   tmp = ""
   lines.length.times do |i|
    if i != 0 and i != lines.length-1 and i != lines.length-2 and i != lines.length-3
     tmp = tmp + lines[i] + "\n"
    end
   end
  tmp
  end

end
