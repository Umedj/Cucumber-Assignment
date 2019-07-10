
require 'rubygems'
require 'selenium-webdriver'

class AutoCheck
	def initialize(userEmail,password)
		@useremail = userEmail
		@password = password
		@siteName = "https://app-automate.browserstack.com/"
		@timeout = 20
		@wait = Selenium::WebDriver::Wait.new(:timeout => @timeout)
		@driver = Selenium::WebDriver.for :chrome
		@driver.manage.timeouts.implicit_wait = 60 
	end

	def checkCompleted
		@driver.get (@siteName)
		userNameElem = @wait.until{@driver.find_element(:id,"user_email_login")}
		passwordElem = @driver.find_element(:id,"user_password")
		userNameElem.send_keys(@useremail)
		passwordElem.send_keys(@password)
		@driver.find_element(:id,"user_submit").click
		element = @driver.find_element(:css,'a[class = "build-link success"]')
		@wait.until{element.displayed? && element.enabled?}
		element.click
		element = @driver.find_element(:class,"status-text")
		@wait.until{ element.displayed? && element.enabled?}
		txt = element.text
		@driver.quit
		return txt
	end	
end
