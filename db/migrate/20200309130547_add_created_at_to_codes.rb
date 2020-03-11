class AddCreatedAtToCodes < ActiveRecord::Migration[5.2]
  def change
	add_column :codes, :created_at, :datetime
  end
end
