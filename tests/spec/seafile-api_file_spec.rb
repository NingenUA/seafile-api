require_relative '../spec_helper'


describe 'SeafileApi::Connect' do
  before(:all) do
      @sf = SeafileApi::Connect.new("kostiantyn.semchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com/","03b865ad-9153-4f24-9638-7f8a04ef67a4")
  end

  it "should create new Connect " do
    expect(@sf.token).to match(/\w{3,}/)
  end

  it "shouldn't create new Connect " do
    sf = SeafileApi::Connect.new("kostiantyn.seadsdasdmchenko@masterofcode.com","Gfhjkrtyrty","http://fs.masterofcode.com/","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    expect(sf.token).to eq(nil)
  end

  describe 'work with file' do
    it "should upload file" do
      expect(@sf.upload_file('tests/spec/fixtures/test.pdf')).to match(/\w{3,}/)
    end

    it "should return direct link" do
      expect(@sf.file_link('test.pdf')).to match(/\/files\//)
    end

    it "should return file detail" do
      expect(@sf.file_detail('test.pdf')).to match(/name/)
    end

    it "should return file history" do
      expect(@sf.file_history('test.pdf')).to match(/commits/)
    end

    it "should return block link" do
      expect(@sf.block_link).to match(/\/upload-blks-api\//)
      end

    xit "should update file" do
      expect(@sf.update_file('tests/spec/fixtures/12.pdf',"test.pdf")).to match(/\/upload-blks-api\//)
    end

    it "should create file" do
      expect(@sf.create_file("/simple.txt")).to match(/success/)
    end

    xit "should copy file" do
      expect(@sf.copy_file("simple.txt","/111")).to match(/\/upload-blks-api\//)
    end

    it "should rename file" do
      expect(@sf.rename_file("/simple.txt","rename.pdf")).to match(/success/)
      end
    it "should move file" do
      expect(@sf.move_file("/rename.pdf","/222")).to match(/success/)
    end
    it "should delete file" do
      expect(@sf.del_file("/222/rename.pdf")).to match(/success/)
    end


  end

end
