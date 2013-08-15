get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :event_register
end

post '/events/create' do
  event = Event.new(organizer_name: params[:organizer_name], organizer_email: params[:organizer_email], title: params[:title], date: params[:date])
  @event = event #we need to create an instance of the Event class here
  
  redirect '/'
end
