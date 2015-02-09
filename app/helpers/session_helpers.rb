def create_user
  @user = User.new(username: params[:username], email: params[:email])
  @user.password = params[:password]
  @user.save
end

def logged_in?
  !session[:user_id].blank?

end

def login
  begin
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id if @user.password == params[:password]
    return true
  rescue
    return false
  end
end

def current_user
  User.find(session[:user_id])
end
