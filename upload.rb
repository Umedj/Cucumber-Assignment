require 'json'

class Upload
  attr_accessor :path
  def initialize(path,username="",access_key="")
    @path = path
    @username = username
    @access_key = access_key
  end

  def getBsUrl
    msgString = %x{curl -u #{@username}:#{@access_key} -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file=#{@path}" }
  	urlHash = JSON.parse(msgString)
  	return urlHash['app_url']
  end

end # End_Upload