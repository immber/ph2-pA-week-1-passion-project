get '/sessions/new' do
  erb :please_sign_in
end

post '/sessions' do
  if params[:sign_in]
    if session_authenticate(params[:username],params[:password])
      redirect '/'
    else
      @message = "you fucked up, try again"
      erb :please_sign_in
    end
  elsif params[:register]
    erb :user_form
  end
end

get '/sessions/:id' do
  session.clear
  redirect '/sessions/new'
end

#----------- USERS -----------
get '/users' do
  erb :user_form
end

post '/users' do
  user = User.create(username: params[:username], password_hash: params[:password], email: params[:email])
  redirect '/sessions/new'
end
