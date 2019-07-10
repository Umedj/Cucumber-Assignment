require './upload'

require 'rubygems'
require 'appium_lib'

class SampleTest
	def initialize
	end

	def setCapabilities(testName,bsUrl)
		caps = {}
		caps['build'] = 'Ruby Appium Sample'
		caps['name'] = testName
		caps['device'] = 'Samsung Galaxy S8 Plus'
		caps['platformName'] = 'android'
		caps['browserstack.debug'] = true
		caps['app'] = bsUrl
		return caps
	end
	 
	def appiumDriver(userName,access_key,caps)
		appium_driver = Appium::Driver.new({
		    'caps' => caps,
		    'appium_lib' => {
		        :server_url => "http://#{userName}:#{access_key}@hub-cloud.browserstack.com/wd/hub"
		    }}, true)
		driver = appium_driver.start_driver

		 
		wait = Selenium::WebDriver::Wait.new(:timeout => 30)
		wait.until { driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
		element = driver.find_element(:accessibility_id, "Search Wikipedia")
		element.click
		 
		driver.quit
		return 'Completed test'
	end

end # End Sample Test

