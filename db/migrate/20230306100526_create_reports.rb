class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :reporter_id
      t.foreign_key :people, column: :reporter_id, on_delete: :cascade, on_update: :cascade 
      t.integer :step_count
      t.integer :sleep_hours
      t.string :symptons, array: true

      t.timestamps
    end
  end
end
