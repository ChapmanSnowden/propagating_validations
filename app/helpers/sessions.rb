def save_name_and_email
  session.clear
  session[:name] = params[:organizer_name]
  session[:email] = params[:organizer_email]
end

def save_all
  session[:title] = params[:title]
  session[:name] = params[:organizer_name]
  session[:email] = params[:organizer_email]
  session[:date] = params[:date]
  session[:errors] = @event.errors.to_a
end

def create_values_from_session
  @title = session[:title]
  @name = session[:name]
  @email = session[:email]
  @date = session[:date]
  @errors = session[:errors]
  session[:errors] = nil
end