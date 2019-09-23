require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/gymclass')

#INDEX

get '/gymclass' do
  @classes = GymClass.all()
  erb(:"gymclass/index")
end


#New - form
get'/gymclass/new' do
  erb (:"gymclass/new")
end

#CREATE

post '/gymclass' do
  @classes = GymClass.new(params)
  @classes.save()
  redirect to ("/gymclass")
end


#DELETE

get '/gymclass/:id/delete' do
  gym_class = GymClass.find(params[:id].to_i)
  gym_class.delete()
  redirect to ('gymclass')
end
