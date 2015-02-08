def logged_in?
   !session[:user_id].blank?

end

def session_authenticate(username,password)
  begin
    user = User.find_by(username: username)
    session[:user_id] = user.id if user.password_hash == password
    return true
  rescue
    return false
  end
end



def current_user
  User.find(session[:user_id])
end
