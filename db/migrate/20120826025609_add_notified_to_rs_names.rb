class AddNotifiedToRsNames < ActiveRecord::Migration
  def change
    add_column :rs_names, :notified, :boolean
  end
end
