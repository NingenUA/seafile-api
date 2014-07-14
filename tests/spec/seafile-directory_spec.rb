require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work with directory' do
    before(:all) do
      @sf = SeafileApi::Connect.new("kostiantyn.semchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    end
    it "should create new Connect " do
      expect(@sf.token).to match(/\w{3,}/)
    end
    it "should create directory" do
      expect(@sf.create_dir("/test")).to match("success")
    end
    it "should show list of dir entry" do
      expect(@sf.list_dir_entry).to match("test.pdf")
    end
    it "should show give_download dir_url" do
      expect(@sf.download_dir("/test")).to match("test")
    end
    it "should share dir" do
      expect(@sf.share_dir("alexandra.zinchenko@masterofcode.com","/test")).to match("{}")
    end
    it "should delete directory" do
      expect(@sf.del_dir("/test")).to match("success")
    end

  end


end