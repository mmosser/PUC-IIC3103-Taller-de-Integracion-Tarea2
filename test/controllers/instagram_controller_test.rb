require 'test_helper'

class InstagramControllerTest < ActionController::TestCase
   test "the truth" do
     assert false
  end

test "request on API instagram respond with 200" do
	q="snow"
	jsonResponse=requestMetaData(q)
	if (jsonResponse==false)
		assert false
	else
		assert true
	end
end







end
