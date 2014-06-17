module SeafileApi
  class Connect

    def add_group_member(user_email,group_id)
      put_new_meber_to_group(user_email,group_id)
    end
    def delete_group_member(user_email,group_id)
      del_group_member(user_email,group_id)
    end

    private
    #curl -X PUuT -d "user_name=user@example.com"-H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/groups/1/members/"
    def put_new_meber_to_group(user_email,group_id)
      token = get_sf_token
      url = "#{self.host}/api2/groups/#{group_id}/members"
      c = curl_new(url,token)
      c.http_put(Curl::PostField.content('user_name', user_email))
      c.body_str
    end

    def del_group_member(user_email,group_id)
      token = get_sf_token
      url = "#{self.host}/api2/groups/#{group_id}/members"
      c = curl_new(url,token)
      c.http_delete(Curl::PostField.content('user_name', user_email))
      c.body_str
    end


  end
end