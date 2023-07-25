## Seaweedfs

a [seaweedfs](https://github.com/chrislusf/seaweedfs) ruby client

### Getting started

Run `gem install seaweedfs` or include it in your project's Gemfile.

```ruby
require 'seaweedfs'
client = Seaweedfs::Client.new(endpoint: "http://localhost:9333")
```

### Operations

```ruby
# upload a file
dir = client.file.dir_assign
file = client.file.upload('file_path', dir.fid, dir.publicUrl)

# file methods
dir.fid                                   # => "1,01766888e0"
client.file.url(dir.fid, dir.publicUrl)   # => "http://localhost:8080/1,01766888e0"
client.file.read(dir.fid, dir.publicUrl)  # => "hello world!" 
file.name                                 # => "test.txt"


# delete file
client.file.delete(dir.fid, dir.publicUrl)
```
