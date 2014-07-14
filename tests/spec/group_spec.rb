require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work with group' do
    before(:all) do
      @sf = SeafileApi::Connect.new("kostiantyn.semchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    end
    it "should create new Connect " do
      expect(@sf.token).to match(/\w{3,}/)
    end

    it "should create new group " do
      expect(@sf.add_group("test_group1")).to match(/success|already/)
    end
    it "should show list of groups " do
      expect(@sf.list_groups).to match(/test_group/)
    end

    it "should send group message" do
      expect(@sf.send_group_message(4,"test message")).to match(/msgid/)
    end
    it "should reply group message" do
      expect(@sf.reply_group_message(4,"test reply message",9)).to match(/msgid/)
    end
    it "should show group messages reply" do
      expect(@sf.group_messages_replies).to match(/\[/)
    end
    it "should show group messaged detail" do
      expect(@sf.group_message_detail(4,9)).to match(/atts/)
    end
    it "should show group messages " do
      expect(@sf.group_messages(4)).to match(/msgs/)
    end

    it "should add new group member" do
      expect(@sf.add_group_member("alexandra.zinchenko@masterofcode.com",4)).to match(/success/)
    end
    it "should delete group member" do
      expect(@sf.del_group_member("alexandra.zinchenko@masterofcode.com",4)).to match(/success/)
    end




  end
end