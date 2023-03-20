class DropAnnouncements < ActiveRecord::Migration[7.0]
  def change
    drop_table :announcements
  end
end
