module ApiHelper
  def funAPI(code, input)
    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    code_path = "#{Rails.root.to_s}/paths/#{path.to_s}.rb"

    File.write(code_path, code)

    rdm = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    path = (0...50).map { rdm[rand(rdm.length)] }.join
    input_path = "#{Rails.root.to_s}/paths/#{path.to_s}"

    File.write(input_path, input)

    res = `timeout 2s ruby #{code_path} < #{input_path}`

    `rm #{code_path}`
    `rm #{input_path}`
    res
  end

end
