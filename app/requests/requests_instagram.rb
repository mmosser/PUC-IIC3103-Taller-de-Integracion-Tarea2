
class Requests_instagram < ApplicationController

def initialize()
end


def getNumberPublications (q)
	uri=URI("https://api.instagram.com/v1/tags/#{q}")
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