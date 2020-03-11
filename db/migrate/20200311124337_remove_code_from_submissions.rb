class RemoveCodeFromSubmissions < ActiveRecord::Migration[5.2]
  def change
	remove_column :submissions, :code
  end
end
