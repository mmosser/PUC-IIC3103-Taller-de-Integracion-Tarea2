class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.




def requestWebWithAuth(uri)
	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'

	#headers = { "Content-Type"=> "application/json; charset=utf-8" }

	response=HTTParty.get(uri+"?access_token="+access_token)

end


def requestMetadata (q,token)
	response=HTTParty.get("https://api.instagram.com/v1/tags/#{q}?access_token=#{token}")
	
	if(response.code < 300)
      return JSON.parse(response.body)
  	else
      return false
  	end
end

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