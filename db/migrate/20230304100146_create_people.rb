class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :password_hash
      t.string :role
      t.string :last_name
      t.string :first_name
      t.string :dormitary

      t.timestamps
    end
  end
end
