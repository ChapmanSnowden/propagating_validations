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
  @event = Event.create(params)

  if @event.save
    erb :event_show
  else
    @errors = @event.errors
    erb :error_message
  end
end
