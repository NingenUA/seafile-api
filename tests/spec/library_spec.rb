require_relative '../spec_helper'

describe 'SeafileApi' do

  describe 'work with library' do
    before(:all) do
      @new_library = SF::create_library("test_library","description","123456")
      @default_library =SF::create_default_library
    end

    it "should create new library" do
      expect(@new_library.to_s).to match("token")
    end
    it "should create new default library" do
      expect(@default_library.to_s).to include("repo_id")
    end
    it "should create publice library" do
      expect(SF::create_public_library(@new_library["repo_id"])).to match("success")
    end


    it "should decrypt library" do
      expect(SF::decrypt_library(@new_library["repo_id"],"123456")).to match("success")
    end
    it "should get default library" do
      expect(SF::default_library).to include("repo_id")
    end
    it "should show list of libraries" do
      expect(SF::list_libraries).to be_instance_of Array
    end
    it "should create sub library" do
      expect(SF::create_sub_library(@default_library["repo_id"],"test_sub_library")).to include("sub_repo_id")
    end
    it "should show list virtual libraries" do
      expect(SF::list_virtual_libraries).to include("virtual-repos")
    end
    it "should show library info" do
      expect(SF::library_info(@new_library["repo_id"])).to include("permission")
    end
    it "should show library owner" do
      expect(SF::library_owner(@new_library["repo_id"])).to include("detail")
    end
    it "should show library history" do
      expect(SF::library_history(@new_library["repo_id"])).to include("commits")
    end
    it "should show library download info" do
      expect(SF::fetch_library_info(@new_library["repo_id"])).to include("repo_id")
    end


    it "should del library" do
      expect(SF::del_library(@new_library["repo_id"])).to match("success")
      end
    it "should remove public library" do
      expect(SF::remove_public_library(@default_library["repo_id"])).to match("success")
    end



  end


end