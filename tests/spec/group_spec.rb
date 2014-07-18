require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work with group' do

    it "should create new group " do
      expect(SF::add_group("test_group1")).to include('success').or include('error')
    end
    it "should show list of groups " do
      expect(SF::list_groups).to include(/replynum/)
    end

    it "should send group message" do
      expect(SF::send_group_message(4,"test message")).to include(/msgid/)
    end
    it "should reply group message" do
      expect(SF::reply_group_message(4,"test reply message",9)).to include(/msgid/)
    end
    it "should show group messages reply" do
      expect(SF::group_messages_replies).to be_instance_of Array
    end
    it "should show group messaged detail" do
      expect(SF::group_message_detail(4,9)).to include(/atts/)
    end
    it "should show group messages " do
      expect(SF::group_messages(4)).to include(/msgs/)
    end

    it "should add new group member" do
      expect(SF::add_group_member($another_email,4)).to include(/success/)
    end
    it "should delete group member" do
      expect(SF::del_group_member($another_email,4)).to include(/success/)
    end




  end
end