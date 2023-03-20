class ChangeMsgAndAnnContentToText < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :content, :text
    change_column :announcements, :content, :text 
  end
end
