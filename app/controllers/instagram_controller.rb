class InstagramController < ApplicationController

def index
end

def buscar
	q=params[:tag]
	json1=getMetaData(q)
	#json2=getPosts(q)
	if (json1==false)
		@jsonResponse= false
	else
		@jsonResponse={ meta: {code: 200},
				   	   data: { metadata: json1,
					#		  posts: json2, 
							  version: "1.0.0"}
					 }
		
	end
	redirect_to "/instagram/tag/buscar"
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


def requestMetaData(q)
access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
headers = { "Content-Type"=> "application/json; charset=utf-8" }

uri=URI("https://api.instagram.com/v1/tags/#{q}?access_token=#{access_token}")
response=HTTParty.get(uri, :headers => headers)
if(response.code < 300)
      return JSON.parse(response.body)
  else
      return false
  end
end


#def getPosts(q)
#	jsonResponse=requestPosts(q)

#  if(jsonResponse==false)
#    return jsonResponse
#  else
    #jsonResponse = jsonResponse.first
#    posts = { _id: jsonResponse['_id'],
#			fechaCreacion: jsonResponse['fechaCreacion'],
#      cuentaOrigen: jsonResponse['origen'],
#      cuentaDestino: jsonResponse['destino'],
#			monto: jsonResponse['monto']}
#	  return paramsBanco
#  end
#end




def getMetaData(q)
	jsonResponse=requestMetaData(q)
	if(jsonResponse==false)
    	return jsonResponse
  	else
   		 jsonResponse = jsonResponse.first
   		 jsonMeta = { total: jsonResponse['media_count']}
	  return jsonMeta
  end

end










end
