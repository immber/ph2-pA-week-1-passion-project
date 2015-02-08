require_relative '../config/environment'

def populate_default_cards
  file = File.open("db/import_files/wcards.txt", "r")
  white_cards = file.map {|line|  line.chomp }
  white_cards.each {|card| Card.create(
    color: "white", text: card, created_by: 0) }
  file = File.open("db/import_files/bcards.txt", "r")
  black_cards= file.map { |line| line.chomp }
  black_cards.each {|card| Card.create(
    color: "black", text: card, created_by: 0) }

end

populate_default_cards

#create one user
  # User.create(username:"jessie", password_hash: 'jessie')
