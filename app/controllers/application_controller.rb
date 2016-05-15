class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.






def requestPosts(q,token)
	#In a first time, we respond with only the last publication (count=1)
	response=HTTParty.get("https://api.instagram.com/v1/tags/#{q}/media/recent?access_token=#{token}&count=1")
	
	if(response.code < 300)
      return JSON.parse(response.body)
  	else
      return false
  	end
end





end