class ChangeRsNamesNotifiedDefaultFalse < ActiveRecord::Migration
  def up
		change_column :rs_names, :notified, :boolean, default: false
		RsName.all.each do |rsn|
			rsn.update_attribute(:notified, false) unless rsn.notified?
		end
  end
end
