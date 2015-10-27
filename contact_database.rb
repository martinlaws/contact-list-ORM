require 'csv'

class ContactDatabase

  attr_accessor :id, :name, :email, :phone

  def initialize(id, name, email, phone)
    @id = id
    @name = name
    @email = email
    @phone = Array.new()
    @phone.push(phone.to_i)
    @new_contact = [@id, @name, @email, @phone]
    Contact.create(@new_contact)
  end
  
  class << self
    def create(new_contact)
      CSV.open("contacts.csv", "a") do |csv|
        csv << new_contact
      end #ends CSV.open do
      all
    end #ends create method
 
    def find(term)
      @term = term
      @match = CSV.read('contacts.csv', 'r').select { |row| row.include?(@term) }
      puts @match
    end
 
    def all
      @contacts = CSV.read('contacts.csv').each do |row| 
        puts row.inspect
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on IDirb
    end
    
  end # ends class << self
end #ends class ContactDatabase