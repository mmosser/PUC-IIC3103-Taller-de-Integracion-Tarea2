class Instagram::ApplicationController < ApplicationController
protect_from_forgery with: :null_session
respond_to :json


#Metodo de prueba
def index
		render json: 'Hola'
end


def buscar

end

#______________________________________________________________________________________________________________________
#
#Here are methods to get a part of the final JSON response we want to provide:



def getMetadata
	if (params[:tag]!=nil && params[:access_token]!=nil)
		response=HTTParty.get("https://api.instagram.com/v1/tags/#{params[:tag]}?access_token=#{params[:access_token]}")
		if(response.code < 300)
	    	format.json {render json: {
				"metadata": {"total": response["data"]["media_count"]},
				"posts": false,
				"version": "1.2.4" },
				status: :ok
			}	
	  	else
			format.json {render json: response, status: :unauthorized}
		end
	else
		format.json {render json: "Your parameters are not valid. You need : tag (string), access_token (string).", status:400}
	end
end
	
def getPosts
	#In a first time, we respond with only the last publication (count=1)
	response=HTTParty.get("https://api.instagram.com/v1/tags/#{params[:tag]}/media/recent?access_token=#{params[:access_token]}&count=1")
	
	if(response.code < 300)
    	render json: {
			"metadata": false,
			"posts": false,




			"version": "1.2.4"
		}	
  	else
		render json: "bad instagram request"
	end	
end



#_______________________________________________________________________________________________________
#
#Here are some tests used to check step-by-step if the app works and where are the bugs:


def testUri
	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
	q='snow'
	render json: 'https://api.instagram.com/v1/tags/'+q+'?access_token='+access_token
end

def testHTTParty
	#access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
	#q='snow'
	
	response=HTTParty.get("https://api.instagram.com/v1/tags/snow?access_token=2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402")
	render json: response["data"]
	
end

def testHTTPartyWithVariable
	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
	q='snow'
	
	response=HTTParty.get("https://api.instagram.com/v1/tags/#{q}?access_token=#{access_token}")
	render json: response
end

def testParam
	render json: {
		"tag": params[:tag]
	}
end

def testHTTPartyWithParam
	#access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'


	response=HTTParty.get("https://api.instagram.com/v1/tags/#{params[:tag]}?access_token=#{params[:access_token]}")
	render json: response
end



end