class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :title 
      t.string :content 
      t.integer :sender_id 
      t.integer :receiver_id 
      t.timestamps

      t.foreign_key :users, column: :sender_id, primary_key: :id, on_delete: :cascade
      t.foreign_key :students, column: :receiver_id, primary_key: :id, on_update: :cascade
    end
  end
end
