require 'csv'

class ContactDatabase

  def initialize
    choice = gets.chomp.to_sym
    
    case choice
    when :new
    when :list
      list
    when :show
    when :find
    end
  end

  def list
    contacts = CSV.read('contacts.csv')
    puts contacts.inspect
  end

  # CSV.open('contacts.csv', 'a') do |contact|
  # contact.array.each do |row_array|
  #   contact << row_array
  # end
end