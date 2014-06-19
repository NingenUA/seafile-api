module SeafileApi
  class Connect
    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/default-repo/"
    def post_default_lib
      token = get_sf_token
      url = "#{self.host}/api2/default-repo/"
      c = curl_new(url,token)
      c.http_post()
      c.body_str
    end

    #curl -X POST -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d9b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/public/
    def post_public_lib(repo_id)
      token = get_sf_token
      url = "#{self.host}/api2/repos/#{repo_id}/public/"
      c = curl_new(url,token)
      c.http_post()
      c.body_str
    end



    #curl -v -d "name=foo&desc=new library" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/
    #TODO: add passw field
    def post_lib(name,desc)
      token = get_sf_token
      url = "#{self.host}/api2/repos/"
      c = curl_new(url,token)
      c.http_post(Curl::PostField.content('name', name),Curl::PostField.content('des', desc))
      c.body_str
    end

    #curl -v -d "password=123" -H 'Authorization: Token e6a33d61954f219a96b60f635cf02717964e4385' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/0c2465a5-4753-4660-8a22-65abec9ec8d0/
    def post_lib_pass(repo_id,password)
      token = get_sf_token
      url = "#{self.host}/api2/repos/#{repo_id}/"
      c = curl_new(url,token)
      c.http_post(Curl::PostField.content('password', password))
      c.body_str
    end
  end

end