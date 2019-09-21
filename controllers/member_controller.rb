require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/member.rb' )

#INDEX

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

#New - Form
get '/members/new' do
  erb(:"members/new")
end

#CREATE
post '/members' do
  @members = Member.new(params)
  @members.save()
  redirect to ("/members")
end

#EDIT
get '/members/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

# UPDATE
post '/members/:id/edit' do
  member = Member.new( params )
  member.update()
  redirect to ("members")
end
