module AuthHelper
	def is_hrm_authorized?(name, pass)
		admin_accounts = { 
			"admin" => "secret", 
			"pekka" => "beer", 
			"arto" => "foobar", 
			"matti" => "ittam"
		}
		
		admin_accounts.has_key? name and admin_accounts[name] == pass
	end
end
