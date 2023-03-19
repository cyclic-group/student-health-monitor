class ChangeUnreadInMessages < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :unread, :boolean, default: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
