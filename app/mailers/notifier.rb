class Notifier < ActionMailer::Base
  default from: "rsnamechecker@gmail.com"

	def name_available(user, name)
		@user = user
		@name = name
		mail(:to => user.email, :subject => "#{name} is available!")
	end
end
