[![Build Status](https://travis-ci.org/mmosser/tarea2-mmosser.svg?branch=master)](https://travis-ci.org/mmosser/tarea2-mmosser)

API

Route : 	POST /instagram/tag/buscar
Params :	tag (string)
			access_token (string)

Tests by travis :

1) test "api normal case"

  	tag_test='snow'
  	access_token_test='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
  	

2) test "api param TOKEN unvalid"

  	tag_test='snow'
  	

3)  test "api param TAG unvalid" 

  	access_token_test='2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
  	

4) test "api request on instagram API unvalid" 

  	tag_test='snow'
  	access_token_test='1'
  	