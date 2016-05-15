class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.








def requestWebWithAuth(uri)
	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'

	headers = { "Content-Type"=> "application/json; charset=utf-8" }
	response
  	query = Hash.new
  	query.store("access_token",access_token)


	response=HTTParty.get(uri+'?access_token='+access_token)
	#response=HTTParty.get(uri, :query => query, :headers => headers)

	if(response.code < 300)
    	  return JSON.parse(response.body)
  	else
    	  return false
  	end
end


def requestMetadata (q)
	uri='https://api.instagram.com/v1/tags/'+q.to_s
	jsonResponse=requestWebWithAuth(uri)
	if(jsonResponse==false)
    	return jsonResponse
  	else
    	jsonResponse = jsonResponse.first
    	metadata = {total: jsonResponse['media_count']}
	return metadata
  end

end

#def requestPosts(q)
 # access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
 # headers = { "Content-Type"=> "application/json; charset=utf-8" }
 # response
  
 # uri=URI("https://api.instagram.com/v1/tags/#{q}/media/recent?access_token=#{access_token}&count=1")
 # response =HTTParty.get(uri, :headers => headers)
  
  
 # if(response.code < 300)
 #     return JSON.parse(response.body)
 # else
 #     return false
 # end
#end





end