
get '/white_cards' do
  if !logged_in?
    erb :'/please_sign_in'
  else
    @white_cards = users_white_cards
    erb :"/white_cards/show_white_cards"
  end
end

get '/white_cards/new' do
  if logged_in?
    erb :"/white_cards/new_white_card"
  else
    erb :'/please_sign_in'
  end
end

post '/white_cards' do
  Card.create(color: "white", text: params[:card_text], created_by: current_user.id)
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


