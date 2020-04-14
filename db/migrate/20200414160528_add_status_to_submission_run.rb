class AddStatusToSubmissionRun < ActiveRecord::Migration[5.2]
  def change
   add_column :submission_runs, :status, :text
  end
end
