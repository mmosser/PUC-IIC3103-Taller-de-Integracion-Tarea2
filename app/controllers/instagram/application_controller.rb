class Instagram::ApplicationController < ApplicationController
protect_from_forgery with: :null_session
respond_to :json


#Metodo de prueba
def index
		render json: 'Hola'


end

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

def testHTTPartyWithParam
	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
	tag=param[:q].to_s

	response=HTTParty.get("https://api.instagram.com/v1/tags/#{q}?access_token=#{access_token}")
	render json: response
end





def testRequestMetadata
	metadata=requestMetadata('snow')
	render json: metadata

end


def getMetaData
	metadata=requestMetadata(params[:q])
	render json: {
		"metadata": metadata,
		"posts": false,
		"version": "1.0.0"
	}
end
	






end