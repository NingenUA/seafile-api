module SeafileApi
  class Connect
    #TODO: show in html, need list
    def get_list_shared
      get_list_shared_files
    end
    def star_a_file(repo_id,file)
      star_file(repo_id,file)
    end
    def unstar_a_file(repo_id,file)
      unstar_file(repo_id,file)
    end

    private
    #https://cloud.seafile.com/api2/starredfiles/
    def get_list_shared_files
      token = get_sf_token
      http = curb_get("/starredfiles/",token)
      http.body_str
    end
    #curl -v -d "repo_id=dae8cecc-2359-4d33-aa42-01b7846c4b32&p=/foo.md" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/starredfiles/
    def star_file(repo_id,file)
      token =get_sf_token
      url = "#{self.host}/api2/starredfiles/"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('repo_id', repo_id),Curl::PostField.content('p', "/#{file}"))
      c.body_str
    end
    #curl -v -d "repo_id=dae8cecc-2359-4d33-aa42-01b7846c4b32&p=/foo.md" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/starredfiles/
    def unstar_file(repo_id,file)
      token =get_sf_token
      url = "#{self.host}/api2/starredfiles/"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_delete(Curl::PostField.content('repo_id', repo_id),Curl::PostField.content('p', "/#{file}"))
      c.body_str
    end
  end
end