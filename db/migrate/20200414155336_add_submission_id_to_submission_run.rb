class AddSubmissionIdToSubmissionRun < ActiveRecord::Migration[5.2]
  def change
    add_column :submission_runs, :submission_id, :int
  end
end
