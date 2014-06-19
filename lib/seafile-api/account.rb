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
      curl_delete("#{self.host}/api2/accounts/#{email}",'').body_str
    end
#curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/
    def list_acc
      curl_get("accounts").body_str
    end
#curl -v -X PUT -d "password=123456" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/newaccount@gmail.com/
    def create_acc(email,pass)
      curl_put("#{self.host}/api2/accounts/#{email}/",{"password" => pass}).body_str
    end
#curl -v -X PUT -d "password=654321&is_staff=true" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/accounts/newaccount@gmail.com/
    def update_acc(email,pass)
      curl_put("#{self.host}/api2/accounts/#{email}/", {"password" => pass}).body_str
    end

#curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/account/info/
    def acc_info
      curl_get("/account/info/").body_str
    end


  end

end