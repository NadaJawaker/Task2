class AddCodeTextToSubmissions < ActiveRecord::Migration[5.2]
  def change
	add_column :submissions, :code, :text
  end
end

