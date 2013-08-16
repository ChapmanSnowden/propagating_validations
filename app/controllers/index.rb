get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  create_values_from_session
  erb :event_register
end

post '/events/create' do
  @event = Event.new(params)

  if @event.save
    save_name_and_email
    erb :event_show
  else
    save_all    
    redirect '/events/new'
  end
end
