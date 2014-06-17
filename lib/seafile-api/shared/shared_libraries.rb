module SeafileApi
  class Connect
    private
    #curl -v -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/shared-repos/
    def get_list_shared_libraries
      token = get_sf_token
      http = curb_get("shared-repos/",token)
      http.body_str
    end

    #curl -X PUT -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-repos/7d42522b-1f6f-465d-b9c9-879f8eed7c6c/?share_type=group&user=user@example.com&group_id=1&permission=rw"
    def put_share_library(repo_id,share_type,user,group_id,permission)
      token = get_sf_token
      url = "#{self.host}/api2/shared-repos/#{repo_id}/?share_type=#{share_type}&user=#{user}group_id=#{group_id}&permission=#{permission}"
      c = curl_new(url,token)
      c.http_put()
      c.body_str
    end

    #curl -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-repos/7d42522b-1f6f-465d-b9c9-879f8eed7c6c/?share_type=personal&user=user@example.com&group_id=0"
    def delete_unshare_library(repo_id,share_type,user,group_id)
      token = get_sf_token
      url = "#{self.host}/api2/shared-repos/#{repo_id}/?share_type=#{share_type}&user=#{user}group_id=#{group_id}"
      c = curl_new(url,token)
      c.http_delete()
      c.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/beshared-repos/"
    def get_list_beshared_libraries
      token = get_sf_token
      http = curb_get("beshared-repos/",token)
      http.body_str
    end
  end
end