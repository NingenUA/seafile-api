module SeafileApi

  class Connect
    def list_accounts
      get_list_acc
    end
    def create_accounts(email,pass)
      put_create_acc(email,pass)
    end
    def update_account(email,pass)
      put_update_acc(email,pass)
    end
    def account_info
      get_acc_info
    end
    def del_account(email)
      delete_acc(email)
    end
  private
  #https://cloud.seafile.com/api2/accounts/{email}/
    def delete_acc(email)
      curl_delete("#{self.host}/api2/accounts/#{email}").body_str
    end
  #curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/
    def get_list_acc
      JSON.parse(curl_get("accounts").body_str)
    end
  #curl -v -X PUT -d "password=123456" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/newaccount@gmail.com/
    def put_create_acc(email,pass)
      curl_put("#{self.host}/api2/accounts/#{email}/",{"password" => pass}).body_str
    end
  #curl -v -X PUT -d "password=654321&is_staff=true" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/newaccount@gmail.com/
    def put_update_acc(email,pass)
      curl_put("#{self.host}/api2/accounts/#{email}/", {"password" => pass}).body_str
    end

  #curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/account/info/
    def get_acc_info
       JSON.parse(curl_get("/account/info/").body_str)
    end


  end

end