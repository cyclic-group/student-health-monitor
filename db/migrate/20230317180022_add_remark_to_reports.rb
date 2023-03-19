class AddRemarkToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :remark, :text
  end
end
