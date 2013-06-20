require_relative "crm_database_v1"

db = Database.new
id = 1000

puts "\e[H\e[2J"
puts "============================================================"
puts 
puts "This is the BML contact management system. Look at your keyboard, now back at your screen:"
puts "Whatever you type on the keyboard appears on the screen. Holy whippersnappers, right?"
puts "Not only that, but whatever you type is then stored in a database. REVOLUTIONARY!"
puts "Well, get on with it. Our database is eager for the insertion of your 'data.'"
puts 
puts "============================================================"
puts

loop do
	puts "The BML CMS accepts the following commands:"
	puts
	puts "d(^_^)b | Type 'add' to add a new contact "
	puts "d(^_^)b | Type 'modify' to modify an existing contact"
	puts "d(^_^)b | Type 'display all' to display all contacts in the database"
	puts "d(^_^)b | Type 'display contact' to display a particular contact"
	puts "d(^_^)b | Type 'display attribute' to display all contacts according to an attribute"
	puts "d(^_^)b | Type 'delete' to delete a particular contact from the database"
	puts "d(^_^)b | Type 'exit' to end the session [ o-(T_T)-o ALL DATA WILL BE DELETED o-(T_T)-o ]"
	puts

	input = gets.chomp

	case input
	
	when "add"
		id += 1
		puts "Please enter the first name of the person:"
		firstname = gets.chomp.capitalize
		puts "Please enter the last name of the person:"
		lastname = gets.chomp.capitalize
		puts "Please enter the email address of the person:"
		email = gets.chomp.downcase
		puts "Please enter any notes relating to the person:"
		notes = gets.chomp
		db.add(Contact.new(id, firstname, lastname, email, notes))
		puts "\e[H\e[2J"
		puts "================================"
		puts "Contact successfully added to database."
		puts "================================"
		puts

	when "modify"
		puts "\e[H\e[2J"
		puts "Enter attribute (id, first name, last name, or email) of contact to be modified."
		selection = gets.chomp
		puts "Are you sure you wish to modify the following contact? Type 'yes' to confirm or 'no' to exit."
		db.display_particular_contact(selection)
		if yesorno = "yes"
			puts "\e[H\e[2J"
			puts "Type one of the following commands:"
			puts "d(^_^)b | 'id' if you want to change the id"
			puts "d(^_^)b | 'firstname' if you want to change the first name"
			puts "d(^_^)b | 'lastname' if you want to chagne the last name"
			puts "d(^_^)b | 'email' if you want to change the email"
			puts
			attribute = gets.chomp
			puts "Type the new value for #{attribute}:"
			modification = gets.chomp
			db.modify_contact(selection, attribute, modification)
			puts "\e[H\e2J"
			puts "================================"
			puts "Contact successfully updated"
			puts "================================"
			puts
		end
	when "display all"
		puts "\e[H\e[2J"
		db.display_all_contacts
		puts
		puts "================================"
		puts "================================"
		puts

	when "display contact"
		puts "\e[H\e[2J"
		puts "Enter the first name, last name, email, or id of the contact to be displayed (e.g. Babajit)"
		userinput = gets.chomp
		db.display_particular_contact(userinput)
		puts
		puts "================================"
		puts "================================"
		puts

	when "display attribute"
		puts "\e[H\e[2J"
		puts "Type one of the following commands:"
		puts "d(^_^)b | 'id' if you want to display all ids"
		puts "d(^_^)b | 'firstname' if you want to display all first names"
		puts "d(^_^)b | 'lastname' if you want to dsplay all last names"
		puts "d(^_^)b | 'email' if you want to display all emails"
		selection = gets.chomp
		puts "\e[H\e[2J"
		puts "List of all contacts according to #{selection}:"
		puts
		puts db.display_info_by_attribute(selection)
		puts
		puts "================================"
		puts "================================"
		puts

	when "delete"
		puts "\e[H\e[2J"
		puts "Enter the first name, last name, email, or id of the contact to be deleted (e.g. Motu Banjot)"
		userinput = gets.chomp
		puts "Are you sure you want to delete the following contacts? Type 'yes' to confirm or 'no' to exist."
		db.display_particular_contact(userinput)
		yesorno = gets.chomp.downcase
		if yesorno == "yes"
			puts "\e[H\3[2J"
			puts "================================"
			if db.delete_contact(userinput)
				puts "d(^_^)b | Contact successfully deleted from database."
			else
				puts "o-(T_T)-o | Contact not found in database."
			end
			puts "================================"
		end

	when "exit"
		puts "\e[H\3[2J"
		break
	end

end