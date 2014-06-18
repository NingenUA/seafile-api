

module SeafileApi
  class Connect
    def get_file_link(filename)
      get_link(filename)
    end
    def get_token
      get_sf_token
    end
    def get_file_description(filename)
      get_description(filename)
    end

    def get_link_revision(filename,commit_id)
      get_link_file_revision(filename,commit_id)
    end

    def get_file_history(filename)
      get_history(filename)
    end

    def get_block_link
      get_block
    end

    def upload_file(file)
      upload(file)
    end

    def update_file(file,target_file=nil)
      update(file,(target_file ||File.basename(file) ))
    end

    def create_file(filename)
      create(filename)
    end

    def rename_file(old_name,new_name)
        rename(old_name,new_name)
    end

    def copy_file(filename,dst_dir='/',dest_repo=self.repo)
      copy(filename,dst_dir,dest_repo)
    end

    def move_file(filename,dst_dir='/',dest_repo=self.repo)
      move(filename,dst_dir,dest_repo)
    end

    def delete_file(filename)
      delete(filename)
    end
    #TODO: TEST !!!
    def revert_file(filename,commit_id)
      revert("/#{filename}",commit_id)
    end

  end
end

