require './lib/seaweedfs'

describe Seaweedfs do
  before(:all) do
    @client = Seaweedfs::Client.new(endpoint: "10.8.0.241:9333")

    @dir ||= @client.file.dir_assign
  end

  it 'has a version number' do
    expect(Seaweedfs::VERSION).not_to be nil
  end

  it 'should upload the specified file' do
    file = @client.file.upload('spec/seaweedfs/fixtures/lorem.txt', @dir.fid, @dir.publicUrl)

    expect(file.size).to be > 0
  end

  it 'should equal to file content' do
    file_content = @client.file.read(@dir.fid, @dir.publicUrl)

    expect(file_content).to eq File.read('spec/seaweedfs/fixtures/lorem.txt')
  end

  it 'should delete the specified file by fid' do
    file = @client.file.delete(@dir.fid, @dir.publicUrl)
    expect(file.size).to be > 0
  end
end
