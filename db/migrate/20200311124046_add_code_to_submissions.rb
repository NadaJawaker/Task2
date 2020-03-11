class AddCodeToSubmissions < ActiveRecord::Migration[5.2]
  def change
	add_column :submissions, :code, :integer
  end
end
