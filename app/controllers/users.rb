get '/sessions/new' do
  erb :please_sign_in
end

#when you click sign-in
post '/sessions' do
  if params[:sign_in]
    if login
      redirect '/'
    else
      @message = {:mismatch => "That didn't work, try again."}
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
  if create_user
    redirect '/sessions/new'
  else
    @message = @user.errors.messages
    erb :please_sign_in
  end

end
