get '/start_game' do
  if !logged_in?
    erb :'/please_sign_in'
  else

  "Now the game is starting"

  "Creating players"
  #call helpers = create_players
  end
end
