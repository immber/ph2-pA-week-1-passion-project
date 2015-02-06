get '/start_game' do
  if !logged_in?
    erb :'/please_sign_in'
  else

  start_game
  @players = current_players

  draw_start_hands

  erb :'/game/starting'

  end

end

get '/start_turn' do
  # @player1_hand = Player.
  @black_card = draw_black_card

end

get '/play_white_card/:id' do
  @players_card = Card.find(params[:id])
  # other players play white cards
  # read white cards played
  # redirect to /winning_black_card
end

# get /winning_black_card do
#   show winner,
#   increment points
#set played on cards to true
#   if game_over
#       redirect '/game over'
#       reset
#     else
#       redirect '/this turn'

# end

