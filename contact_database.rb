require 'csv'
require 'pry'

class ContactDatabase

  attr_accessor :id, :name, :email, :phone

  def initialize(id, name, email, phone)
    @id = id
    @name = name
    @email = email
    @phone = Array.new()
    @phone.push(phone.to_i)
    @new_contact = [@id, @name, @email, @phone]
  end
  
  class << self

    def load_file
      return CSV.read("contacts.csv", "r")
    end

    def save_file(new_contact_array)
      CSV.open("contacts.csv", "a") do |csv|
        csv << new_contact_array
      end
    end
 
    def all
      @contacts = CSV.read('contacts.csv').each do |row| 
        # puts row.join("#") 
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on IDirb
    end
    
  end # ends class << self
end #ends class ContactDatabase