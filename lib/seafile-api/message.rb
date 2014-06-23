module SeafileApi
  class Connect
    def list_user_message(to_email)
      get_list_message(to_email)
    end
    def unread_message
      get_count_unread_message
    end
    def reply_user_message(to_email,message)
      post_reply_message(to_email,{"message" => message})
    end

    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/user/msgs/"#{email}/"
    def get_list_message(email)
      curl_get("user/msgs/#{email}/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/unseen_messages/"

    def get_count_unread_message
      curl_get("unseen_messages/").body_str
    end

    #curl -d "message=this is a user msg reply" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/user/msgs/2/"
    def post_reply_message(email,data)
      curl_post("#{self.host}/api2/user/msgs/#{email}/",data).body_str
    end

  end

end