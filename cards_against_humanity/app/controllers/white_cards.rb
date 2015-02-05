
get '/white_cards' do
  @white_cards = [1,2,3] #Cards.where(type: 'white', created_by: "user_id")
  erb :"/white_cards/show_white_cards"
end

get '/white_cards/new' do
  erb :"/white_cards/new_white_card"
end

post '/white_cards' do
end

get '/white_cards/:id' do
end

get '/white_cards/:id/edit' do
end

put 'white_cards/:id' do
end

delete 'white_cards/:id' do
end
