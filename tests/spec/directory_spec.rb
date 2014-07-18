require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work with directory' do
    it "should create directory" do
      expect(SF::create_dir("/test")).to match("success")
    end
    it "should show list of dir entry" do
      expect(SF::list_dir_entry).to be_instance_of Array
    end
    it "should show give_download dir_url" do
      expect(SF::download_dir("/test")).to match("test")
    end
    it "should share dir" do
      expect(SF::share_dir($another_email,"/test")).to match("{}")
    end
    it "should delete directory" do
      expect(SF::del_dir("/test")).to match("success")
    end

  end


end