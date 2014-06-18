module SeafileApi
  class Connect
    #share
    def list_file_share_link
      get_list_shared_files_link
    end

    #TODO need test output!!! something wrong
    def create_file_share_link(file,repo_id=self.repo)
      create_share_link("/#{file}",repo_id)
    end
    def delete_file_share_link(shared_t)
      delete_share_link(shared_t)
    end

    #shared_files
    def list_shared_files
      get_list_shared_files
    end

    def download_shared_file(file_t)
      get_shared_file_link(file_t)
    end
    def shared_file_detail(file_t)
      get_share_file_detail(file_t)
    end

    def delete_shared_file(file_t)
      del_shared_file(file_t)
    end
    #TODO need test"error_msg\": \"Token not found\"}
    def download_private_shared_file(file_t)
      get_private_shared_file_link(file_t)
    end
    #TODO need test"error_msg\": \"Token not found\"}
    def private_shared_file_detail(file_t)
      get_private_shared_file_detail(file_t)
    end

    #shared_libraries
    def list_shared_libraries
      get_list_shared_libraries
    end
    #TODO: need know what it do
    def list_beshared_libraries
      get_list_beshared_libraries
    end
    #TODO need test not working
    def share_library(repo_id,user,group_id,permission="rw",share_type="group")
      put_share_library(repo_id,share_type,user,group_id,permission)
    end
    #TODO need test not working wrong user error
    def unshare_library(repo_id,share_type,user,group_id)
      delete_unshare_library(repo_id,share_type,user,group_id)
    end

  end
end