require_relative '../spec_helper'


describe 'SeafileApi::Connect' do

  it "should create new Connect " do
    expect(SF::token).to match(/\w{3,}/)
  end
=begin
  it "shouldn't create new Connect " do
    sf = SeafileApi::Connect.new("wrong email","Gfhjkrtyrty","http://fs.masterofcode.com","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    expect(sf.token).to eq(nil)
  end
=end
  describe 'work with file' do
    it "should upload file" do
      expect(SF::upload_file('tests/spec/fixtures/test.pdf')).to match(/\w{3,}/)
    end

    it "should return direct link" do
      expect(SF::file_link('test.pdf')).to match(/\/files\//)
    end

    it "should return file detail" do
      expect(SF::file_detail('test.pdf')).to include(/name/)
    end



    describe 'and history' do
      before :all do
        @ret = SF::file_history('test.pdf')
      end
      it "should return file history" do
        expect(@ret).to include(/commits/)
      end
      it "should return link to specific revision of file" do
        expect(SF::link_revision("test.pdf",@ret["commits"][0]["id"])).to match(/\/files\//)
      end

    end

    it "should return block link" do
      expect(SF::block_link).to match(/\/upload-blks-api\//)
    end

    it "should update file" do
      expect(SF::update_file('tests/spec/fixtures/12.pdf',"/test.pdf")).to match(/\w{6,}/)
    end


    it "should create file" do
      expect(SF::create_file("/simple.txt")).to match(/success/)
    end

    xit "should copy file" do
      expect(SF::copy_file("simple.txt","/111")).to match(/\/upload-blks-api\//)
    end


    it "should rename file" do
      expect(SF::rename_file("/simple.txt","rename.pdf")).to match(/success/)
      end
    it "should move file" do
      expect(SF::move_file("/rename.pdf","/222")).to match(/success/)
    end

    it "should delete file" do
      expect(SF::del_file("/222/rename.pdf")).to match(/success/)
      expect(SF::del_file("/test.pdf")).to match(/success/)

    end


  end

end
