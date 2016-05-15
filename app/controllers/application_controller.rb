require 'requests'

class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def requestWebWithAuth(uri)
	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'

	headers = { "Content-Type"=> "application/json; charset=utf-8" }
	response
  	query = Hash.new
  	query.store("access_token",access_token)

	response=HTTParty.get(uri, :query => query, :headers => headers)

	if(response.code < 300)
    	  return JSON.parse(response.body)
  	else
    	  return false
  	end
end








end