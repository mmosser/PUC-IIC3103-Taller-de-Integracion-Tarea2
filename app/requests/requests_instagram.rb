
class Requests_instagram < ApplicationController

def initialize()
end


def getMetadata (q)
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





end