module SeafileApi
  class Connect
    def list_user_message(email)
      list_message(email)
    end
    def unread_message
      count_unread_message
    end
    def reply_user_message(email,message)
      reply_message(email,message)
    end

    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/user/msgs/"#{email}/"
    def list_message(email)
      token = get_sf_token
      http = curb_get("user/msgs/#{email}/",token)
      http.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/unseen_messages/"

    def count_unread_message
      token = get_sf_token
      http = curb_get("unseen_messages/",token)
      http.body_str
    end

    #curl -d "message=this is a user msg reply" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/user/msgs/2/"
    def reply_message(email,message)
      token =get_sf_token
      url = "#{self.host}/api2/user/msgs/#{email}/"
      c = curl_new(url,token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('message', "#{message}"))
      c.body_str
    end

  end

end