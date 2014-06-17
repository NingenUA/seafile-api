module SeafileApi
  class Connect
    private
    #curl -v -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/8f5f2222-72a8-454f-ac40-8397c5a556a8/
    def delete_lib(repo_id)
      token = get_sf_token
      url = "#{self.host}/repos/#{repo_id}/"
      c = curl_new(url,token)
      c.http_delete()
      c.body_str
    end

    #curl -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d9b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/public/
    def delete_public_lib(repo_id)
      token = get_sf_token
      url = "#{self.host}/repos/#{repo_id}/public/"
      c = curl_new(url,token)
      c.http_delete()
      c.body_str
    end
  end

end