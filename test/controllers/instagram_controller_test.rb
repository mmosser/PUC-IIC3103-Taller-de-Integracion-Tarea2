require 'test_helper'

class InstagramControllerTest < ActionController::TestCase

#init test
  # test "the truth" do
  #   assert true
  # end

#_____________________________________________________________________________
#test api buscar
  test "api normal case" do
  	tag_test='snow'
  	access_token_test='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
    post :buscar, {'tag'=>tag_test, 'access_token'=>access_token_test} 

  	assert_response(200)
  end


  test "api param TOKEN unvalid" do
  	tag_test='snow'

    post :buscar, {'tag'=>tag_test} 	

  	assert_response(400)

  end

  test "api param TAG unvalid" do
  	access_token_test='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'

  	post :buscar, {'access_token'=>access_token_test}   

	
  	assert_response(400)

  
  end


  test "api request on instagram API unvalid" do
  	tag_test='snow'
  	access_token_test='1'

    post :buscar, {'tag'=>tag_test, 'access_token'=>access_token_test} 
  	
  	assert_response(400)

  end

end