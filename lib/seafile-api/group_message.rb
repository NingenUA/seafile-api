module SeafileApi
  class Connect
    def group_messages(group_id)
      get_group_messages(group_id)
    end
    def group_message_detail(group_id,msg_id)
      get_group_message_detail(group_id,msg_id)
    end
    def group_messages_replies
      get_group_messages_replies
    end
    #TODO: Page unavailable<
    def send_group_message(group_id,message,repo_id=self.repo,path=nil)
      send_message_to_group(group_id,message,repo_id,"/#{path}")
    end

    #TODO: Page unavailable<
    def reply_group_message(group_id,message,msg_id)
      reply_message_to_group(group_id,message,msg_id)
    end

    private

    a#curl -d "message=this is another test&repo_id=c7436518-5f46-4296-97db-2fcba4c8c8db&path=/123.md" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/msgs/1/"
    def send_message_to_group(group_id,message,repo_id,path)
      token = get_sf_token
      url = "#{self.host}/api2/group/msgs/#{group_id}/"
      c = curl_new(url,token)
      c.http_post(Curl::PostField.content('massage', message),Curl::PostField.content('repo_id', repo_id),Curl::PostField.content('path', path))
      c.body_str
    end

    #curl -d "message=this is a reply" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/1/msg/1/"
    def reply_message_to_group(group_id,message,msg_id)
      token = get_sf_token
      url = "#{self.host}/api2/group/#{group_id}/msg/#{msg_id}/"
      c = curl_new(url,token)
      c.http_post(Curl::PostField.content('massage', message))
      c.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/msgs/1/"
    def get_group_messages(group_id)
      token = get_sf_token
      http = curb_get("group/msgs/#{group_id}/",token)
      http.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/1/msg/1/"
    def get_group_message_detail(group_id,msg_id)
      token = get_sf_token
      http = curb_get("group/#{group_id}/msg/#{msg_id}/",token)
      http.body_str
    end
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/new_replies/"
    def get_group_messages_replies
      token = get_sf_token
      http = curb_get("new_replies/",token)
      http.body_str
    end

  end
end