class RsName < ActiveRecord::Base
  attr_accessible :name, :user_id
	belongs_to :user
	validates :user_id, presence: true
	validates :name, format: { with: /\A[\w ]{1,12}\z/ }

	def self.check_all_names
		names = RsName.all.select{|n| !n.notified}.collect{|n| n.name.gsub(' ', '_')}.join(' ')
		results = `java -jar script/namechecker.jar #{APP_CONFIG['rs_username']} #{APP_CONFIG['rs_password']} #{names}`.split("\n").collect{|x| x.split("===")}
		available_names = results.collect{|result| RsName.where(:name => result[0], :notified => false) if result[1]=="OK"}.flatten.compact
		available_names.each do |rs_name|
			Notifier.name_available(rs_name.user, rs_name.name).deliver
			rs_name.update_attribute(:notified, true)
		end
	end
end
