require 'test_helper'

class Instagram::ApplicationControllerTest < ActionController::TestCase

#init test
  test "the truth" do
    assert true
  end

#_____________________________________________________________________________
#test api getMetaData
  test "api getMetadata normal case" do
  	tag='snow'
  	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
  	uri="https://tarea2-mmosser-staging.herokuapp.com/instagram/tag/metadata"

  	query = Hash.new
  	query.store('tag', tag)
  	query.store('acces_token', access_token)

  	response=HTTParty.post(uri, :body => query.to_json)
  	assert_response(200)
  #	if (response.code==200)
  #		assert true
  #	else
  #		assert false
  #	end
  end


  test "api getMetadata param TOKEN unvalid" do
  	tag='snow'
  	uri="https://tarea2-mmosser-staging.herokuapp.com/instagram/tag/metadata"

  	query = Hash.new
  	query.store('tag', tag)
  	

  	response=HTTParty.post(uri, :body => query.to_json)
  	assert_response(400)
  end

  test "api getMetadata param TAG unvalid" do
  	access_token='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
  	uri="https://tarea2-mmosser-staging.herokuapp.com/instagram/tag/metadata"

  	query = Hash.new
  	
  	query.store('acces_token', access_token)

  	response=HTTParty.post(uri, :body => query.to_json)

  	assert_response(400)
  
  end


  test "api getMetadata request on instagram API unvalid" do
  	tag='snow'
  	access_token='1'
  	uri="https://tarea2-mmosser-staging.herokuapp.com/instagram/tag/metadata"

  	query = Hash.new
  	query.store('tag', tag)
  	query.store('acces_token', access_token)

  	response=HTTParty.post(uri, :body => query.to_json)
  	assert_response(400)
  end

end