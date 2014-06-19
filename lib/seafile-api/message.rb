module SeafileApi
  class Connect
    def list_user_message(to_email)
      list_message(to_email)
    end
    def unread_message
      count_unread_message
    end
    def reply_user_message(to_email,message)
      reply_message(to_email,message)
    end

    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/user/msgs/"#{email}/"
    def list_message(email)
      curl_get("user/msgs/#{email}/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/unseen_messages/"

    def count_unread_message
      curl_get("unseen_messages/").body_str
    end

    #curl -d "message=this is a user msg reply" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/user/msgs/2/"
    def reply_message(email,message)
      c = curl_post("#{self.host}/api2/user/msgs/#{email}/")
      c.http_post(Curl::PostField.content('message', "#{message}"))
      c.body_str
    end

  end

end