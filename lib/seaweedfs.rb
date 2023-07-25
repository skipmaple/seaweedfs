require 'faraday'
require 'faraday/multipart'
require 'seaweedfs/version'
require 'mimemagic'

module Seaweedfs
  autoload :Client, 'seaweedfs/client'
  autoload :Error, 'seaweedfs/error'
  autoload :Resource, 'seaweedfs/resource'
  autoload :Object, 'seaweedfs/object'

  # api
  autoload :File, 'seaweedfs/resources/file'
  # obj
  autoload :FileResource, 'seaweedfs/objects/file'


end
