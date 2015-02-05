
get '/white_cards' do
  user_id = 1
  @white_cards = Card.where(color: "white", created_by: 1)
  erb :"/white_cards/show_white_cards"
end

get '/white_cards/new' do
  erb :"/white_cards/new_white_card"
end

post '/white_cards' do
  Card.create(color: "white", text: params[:card_text], created_by: 1)
  redirect '/white_cards'
end

put '/white_cards/:id' do
  update_card = Card.find(params[:id])
  update_card.update_attributes(text: params[:card_text])
  redirect '/white_cards'
end

delete '/white_cards/:id' do
  Card.destroy(params[:id])
  redirect '/white_cards'
end

get '/white_cards/:id/edit' do
  @card = Card.find(params[:id])
  erb :"/white_cards/edit_white_card"
end


