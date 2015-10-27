require_relative './contact_database'

class Contact
 
  attr_accessor :id, :name, :email, :phone

  def initialize (name, email, phone)
    @id = (ContactDatabase.all.length + 1)
    @name = name
    @email = email
    @phone = Array.new()
    @phone.push(phone.to_i)
    @new_contact = [@id, @name, @email, @phone]
    Contact.create(@new_contact)
  end
 
  # def to_s
  #   @contacts
  # end
 
  ## Class Methods
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
      ContactDatabase.all
    end
    
    # def show(id)
    #   # TODO: Show a contact, based on IDirb
    # end
  end
end