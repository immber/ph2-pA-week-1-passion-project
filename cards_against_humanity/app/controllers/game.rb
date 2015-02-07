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
  @players = current_players
  @hand = @players[0].cards_in_hand
  @black_card = draw_black_card
  save_black_card(@black_card)
  erb :'/game/turn'
end

get '/play_white_card/:id' do
  @players_card = Card.find(params[:id])
  @cards_played = virtual_players_go(@players_card)
  save_cards_played(@cards_played)
  @black_card = black_card_in_play
  erb :'game/played_cards'

end

get '/show_winner' do
  puts 'starting show winner'
  @winning_card = pick_winning_card
  @black_card = black_card_in_play
  @turn_winner = PlayedCard.find_by(card_id: @winning_card.id, game_id: current_game.id).player
  update_points(@turn_winner)
  discard_cards
  each_player_draw
  if game_over?
    erb :'game/game_over'
  else
    erb :'game/show_winner'
  end
end






