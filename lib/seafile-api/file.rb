

module SeafileApi
  class Connect
    def get_file_link(filename,repo=self.repo)
      get_link(filename,repo)
    end
    def get_token
      get_sf_token
    end
    def get_file_description(filename,repo=self.repo)
      get_description(filename,repo)
    end

    def get_link_revision(filename,commit_id,repo=self.repo)
      get_link_file_revision(filename,commit_id,repo)
    end

    def get_file_history(filename,repo=self.repo)
      get_history(filename,repo)
    end

    def get_block_link(repo=self.repo)
      get_block(repo)
    end

    def upload_file(file,repo=self.repo)
      upload(file,repo)
    end

    def update_file(file,target_file=nil,repo=self.repo)
      update(file,(target_file ||File.basename(file) ),repo)
    end

    def create_file(filename,repo=self.repo)
      create(filename,repo)
    end

    def rename_file(old_name,new_name,repo=self.repo)
        rename(old_name,new_name,repo)
    end

    def copy_file(filename,dst_dir='/',dest_repo=self.repo,src_repo=self.repo)
      copy(filename,dst_dir,dest_repo,src_repo)
    end

    def move_file(filename,dst_dir='/',dest_repo=self.repo,src_repo=self.repo)
      move(filename,dst_dir,dest_repo,src_repo)
    end

    def delete_file(filename,repo=self.repo)
      delete(filename,repo)
    end
    #TODO: TEST !!!
    def revert_file(filename,commit_id,repo=self.repo)
      revert("/#{filename}",commit_id,repo)
    end

  end
end

