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

  #Guardando el id de la clase  que se selecciono - Ver index ternary
  @gym_class_id = params[:gym_class_id].to_i
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

# Para mantener el ultimo miembro que se selecciono para hacer el book de una clase
  @gym_class_id = params[:gym_class_id].to_i
  @member_id = params[:member_id].to_i

  @members = Member.all()
  @classes = GymClass.all()
  erb(:"booking/new")
end
