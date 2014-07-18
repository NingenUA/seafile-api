module SeafileApi
  class Connect
    private
    #curl -X PUuT -d "user_name=user@example.com"-H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/groups/1/members/"
    def put_new_meber_to_group(user_email,group_id)
      JSON.parse(curl_put("#{self.host}/api2/groups/#{group_id}/members/",{"user_name" => user_email}).body_str)
    end

    def delete_group_member(user_email,group_id)
      JSON.parse(curl_delete("#{self.host}/api2/groups/#{group_id}/members/",{'user_name' =>user_email}).body_str)
    end
  end
end