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
      CSV.open("contacts.csv", "a") { |csv| csv << new_contact_array }
    end # ends save_file
  end # ends class << self
end #ends class ContactDatabase