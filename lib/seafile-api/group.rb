module SeafileApi
  class Connect
    #TODO: bring to a single result type
    def list_groups
      get_list_groups
    end
    def add_group(group_name)
      add_new_group(group_name)
    end
    #group_message
    def group_messages(group_id)
      get_group_messages(group_id)
    end
    def group_message_detail(group_id,msg_id)
      get_group_message_detail(group_id,msg_id)
    end
    def group_messages_replies
      get_group_messages_replies
    end

    def send_group_message(group_id,message,repo_id=self.repo,path="/")
      send_message_to_group(group_id,{"message"=> message,"repo_id"=> repo_id,"path"=> path})
    end

    def reply_group_message(group_id,message,msg_id)
      reply_message_to_group(group_id,msg_id,{"message" => message})
    end

    #group member
    def add_group_member(user_email,group_id)
      put_new_meber_to_group(user_email,group_id)
    end

    def delete_group_member(user_email,group_id)
      del_group_member(user_email,group_id)
    end

  end
end