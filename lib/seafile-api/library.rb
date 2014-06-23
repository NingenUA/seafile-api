module SeafileApi

  class Connect
    #get libraries
    def default_library
      get_default_lib
    end
    def create_sub_library(repo_id,name,p='/')
      get_create_sub_lib(repo_id,p,name)
    end
    #search not supported
    def search_libraries(keyword)
      get_searched_lib(keyword)
    end
    def list_libraries
      get_list_lib
    end

    def list_virtual_libraries
      get_list_virtual_lib
    end
    def library_info(repo_id)
      get_lib_info(repo_id)
    end

    def library_owner(repo_id)
      get_lib_owner(repo_id)
    end

    def library_history(repo_id)
      get_lib_history(repo_id)
    end
    def fetch_library_info(repo_id)
      get_lib_download_info(repo_id)
    end

    #post libraries
    def create_library(name,desc="new repo",pwd=nil)
      post_lib({"name" =>name,"desc" =>desc,"passwd" => pwd})
    end
    def create_default_library
      post_default_lib
    end
    def create_public_library(repo_id)
      post_public_lib(repo_id)
    end

    def decrypt_library(repo_id,password)
      post_lib_pass(repo_id,{'password' => password })
    end

    # del libraries
    def del_library(repo_id)
      delete_lib(repo_id)
    end
    def remove_public_library(repo_id)
      delete_public_lib(repo_id)
    end




    private


  end

end