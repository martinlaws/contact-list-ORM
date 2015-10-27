require_relative './contact_database'
require 'pry'

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
      @new_contact = new_contact
      ContactDatabase.create(@new_contact)
    end 

    def find(term)
      ContactDatabase.find(term)
    end
 
    def all
      ContactDatabase.all
    end
    
    def show(id)
      ContactDatabase.find(id)
    end
  end
end