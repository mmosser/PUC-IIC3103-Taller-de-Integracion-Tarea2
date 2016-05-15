class Instagram::ApplicationController < ApplicationController
protect_from_forgery with: :null_session
respond_to :json


#Metodo de prueba
def index
		render json: 'Hola'
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