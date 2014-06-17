module SeafileApi
  class Connect
    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-links/"
    def get_list_shared_files
      token = get_sf_token
      http = curb_get("shared-links/",token)
      http.body_str
    end

    #curl -v -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-links/?t=0ae587a7d1"
    def delete_share_link(shared_t)
      token =get_sf_token
      url = "#{self.host}/api2/shared-links/?t=#{shared_t}"
      c = curl_new(url,token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_delete()
      c.body_str
    end

    #curl -v  -X PUT -d "p=/foo.md" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/afc3b694-7d4c-4b8a-86a4-89c9f3261b12/file/shared-link/
    def create_share_link(file,repo_id)
      token = get_sf_token
      url = "#{self.host}/api2/repos/#{repo_id}/file/shared-link/"
      c = curl_new(url,token)
      c.http_put(Curl::PostField.content('p', file))
      c.body_str
    end

  end
end