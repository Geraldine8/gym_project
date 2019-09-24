require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/booking')


#INDEX
get '/bookings' do
  @classes = GymClass.all()
  erb(:"booking/index")
end

post '/bookings' do
  @members = Booking.member_by_class_id(params[:gym_class_id])
  @classes = GymClass.all()
  erb(:"booking/index")
end

#New - Form
get '/bookings/new' do
  @members = Member.all()
  @classes = GymClass.all()
  erb(:"booking/new")
end

post '/bookings/new' do
  booking = Booking.new(params)
  @result =  booking.create_booking()
  redirect to ("/bookings") if @result === nil

  @members = Member.all()
  @classes = GymClass.all()
  erb(:"booking/new")
end
