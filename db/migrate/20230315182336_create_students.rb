class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :last_name 
      t.string :first_name 
      t.string :dormitary 
      t.timestamps

      t.foreign_key :users, column: :id, primary_key: :id, on_delete: :cascade, on_update: :cascade
    end
  end
end
