class CreateSubmissionRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :submission_runs do |t|
      t.text :input
      t.text :output

      t.timestamps
    end
  end
end
