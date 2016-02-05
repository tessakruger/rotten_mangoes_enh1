module UsersHelper

	def check_admin(admin)
		if admin?
			puts "yes"
		else
			puts "no"
		end
	end

end
