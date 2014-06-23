module SeafileApi
  class Connect
    private
    #curl -d "message=this is another test&repo_id=c7436518-5f46-4296-97db-2fcba4c8c8db&path=/123.md" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/msgs/1/"
    def post_message_to_group(group_id,data)
      curl_post("#{self.host}/api2/group/msgs/#{group_id}/",data).body_str
    end

    #curl -d "message=this is a reply" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/1/msg/1/"
    def post_reply_message_to_group(group_id,msg_id,data)
      curl_post("#{self.host}/api2/group/#{group_id}/msg/#{msg_id}/",data).body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/msgs/1/"
    def get_group_messages(group_id)
      curl_get("group/msgs/#{group_id}/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/group/1/msg/1/"
    def get_group_message_detail(group_id,msg_id)
      curl_get("group/#{group_id}/msg/#{msg_id}/").body_str
    end
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/new_replies/"
    def get_group_messages_replies
      curl_get("new_replies/").body_str
    end

  end
end