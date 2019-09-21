require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/member_controller')

get '/' do
  erb( :homepage )
end
