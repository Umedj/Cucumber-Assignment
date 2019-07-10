
Feature: Check the apk upload and complete the test
 
 
Scenario Outline: Upload and Test the apk successfully

  Given path as <path>
  And userName as <userName>, accessKeys as <accessKeys>
  And the bsUrl is recieved
  When I upload the test to App Automate
  Then I should recieve Completed status on dashboard


 Examples:
|path												 	  |userName	    |accessKeys			  |
|"@/Users/umedjadhav/Desktop/Cucumber/WikipediaSample.apk"|"umedjadhav2"|"uqLki1YEsd71CDxZV7CW"|


