class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports, force: :cascade do |t|
      t.integer :reporter_id
      t.integer :step_count
      t.integer :sleep_hours
      t.string :symptons, array: true
      t.timestamps

      t.foreign_key :students, column: :reporter_id, primary_key: :id, on_delete: :cascade, on_update: :cascade 
    end
  end
end
