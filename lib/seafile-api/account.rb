module SeafileApi

  class Connect
    def list_accounts
      list_acc
    end
    def create_accounts(email,pass)
      create_acc(email,pass)
    end
    def update_account(email,pass)
      update_acc(email,pass)
    end
    def account_info
       acc_info
    end
    def delete_account(email)
      delete_acc(email)
    end
  private
  #TODO: add result processing
 #   https://cloud.seafile.com/api2/accounts/{email}/
    def delete_acc(email)
      token =get_sf_token
      url = "#{self.host}/api2/accounts/#{email}"
      c = curl_new(url,token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_delete()
      c.body_str
    end
#curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/
    def list_acc
      token = get_sf_token
      http = curb_get("accounts",token)
      http.body_str
    end
#curl -v -X PUT -d "password=123456" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/newaccount@gmail.com/
    def create_acc(email,pass)
      token = get_sf_token
      url = "#{self.host}/api2/accounts/#{email}/"
      c = curl_put(url,token)
      c.put_data= {"password" => pass}.to_json
      c.post
      c.body_str
    end
#curl -v -X PUT -d "password=654321&is_staff=true" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/newaccount@gmail.com/
    def update_acc(email,pass)
      token = get_sf_token
      url = "#{self.host}/api2/accounts/#{email}/"
      c = curl_put(url,token)
      c.put_data= {"password" => pass}.to_json
      c.post
      c.body_str
    end

#curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/account/info/
    def acc_info
      token = get_sf_token
      http = curb_get("/account/info/",token)
      http.body_str
    end

#TODO: remake culr_get, and intergrate curb_get
    def curb_get(url,token)
      Curl.get(URI::encode("#{self.host}/api2/#{url}")) do|http|
        http.headers['Authorization'] = "Token #{token}"
      end
    end
  end

end