require_relative '../../upload'
require_relative '../../sampleTest'
require_relative '../../autocheck'

email = "umed.jadhav@somaiya.edu"
password = "qwertybalganesh"

Given("path as {string}") do |string|
  up = Upload.new(string)
  @path = up.path
  expect(@path).to eql "@/Users/umedjadhav/Desktop/Cucumber/WikipediaSample.apk"
end

Given("userName as {string}, accessKeys as {string}") do |username, acckey|
	@userName = username
	@accessKey = acckey
	@email = email
	@password = password
	expect(@userName).to eql "umedjadhav2"
	expect(@accessKey).to eql "uqLki1YEsd71CDxZV7CW"
	expect(@email).to eql "umed.jadhav@somaiya.edu"
	expect(@password).to eql "qwertybalganesh" 
end

And ("the bsUrl is recieved") do 
  up = Upload.new(@path,@userName,@accessKey)
  @bsUrl = up.getBsUrl
  expect(@bsUrl).to eql 'bs://b48354b4671e113c58657bb92ce522f090ac9611'
end

When ("I upload the test to App Automate") do
	samTest = SampleTest.new
	caps = samTest.setCapabilities("Umed's test",@bsUrl)
	msg = samTest.appiumDriver(@userName,@accessKey,caps)
	expect(msg).to eql "Completed test"
end

Then("I should recieve Completed status on dashboard") do
	check = AutoCheck.new(@email,@password)
	status = check.checkCompleted
	expect(status).to eql "Completed"
end