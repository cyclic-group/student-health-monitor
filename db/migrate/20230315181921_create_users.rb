class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, force: :cascade do |t|
      t.string :password_hash
      t.string :role 

      t.timestamps
    end
  end
end
