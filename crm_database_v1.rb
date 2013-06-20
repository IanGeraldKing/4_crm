require_relative "crm_contact_v1"

class Database

	attr_accessor :contacts_array

	def initialize
		@contacts_array = Array.new
	end

	def add(contact)
		@contacts_array << contact
	end

	def modify_contact(selection, attribute, modification)
		contact = @contacts_array.detect do |contact|
			(contact.id == selection) || (contact.firstname == selection) || (contact.lastname == selection) || (contact.email == selection)
		end
		if contact
			contact.send(attribute + '=', modification) rescue nil
		end
	end

	def display_all_contacts
		@contacts_array.each do |contact|
			contact.display_contact
		end
	end

	def display_particular_contact(attribute)
		@contacts_array.each do |contact|
			if (contact.id == attribute) || (contact.firstname == attribute) || (contact.lastname == attribute) || (contact.email == attribute)
				contact.display_contact
			end
		end
	end

	def display_info_by_attribute(arg)
		attribute_array = []
		@contacts_array.each do |contact|
			attribute_array << contact.send(arg)
		end
		attribute_array 
	end

	def delete_contact(attribute)
		@contacts_array.each do |contact|
			if (contact.id == attribute) || (contact.firstname == attribute) || (contact.lastname == attribute) || (contact.email == attribute)
				@contacts_array.delete(contact)
			else
				return false
			end
		end 
	end

end
