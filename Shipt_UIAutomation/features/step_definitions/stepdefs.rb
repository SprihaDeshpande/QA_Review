Given(/^I navigate to "([^"]*)"$/) do |term|
@browser ||= Watir::Browser.new :Chrome
@browser.goto "https://shop.shipt.com/"
end

When /^I wait for (\d+) seconds?$/ do |n|
    sleep(n.to_i)
end

When /^I enter good credentials on to login?$/ do
    @browser.text_field(:xpath => '//input[@data-test="LoginForm-emailField"]').set "spriha@shipt.com"
    @browser.text_field(:xpath => '//input[@type="password"]').set("Spriha@123")
end

When /^I click "([^"]*)"$/ do |button_name|
$vars = $dictionary[button_name]
@browser.element(:xpath => $vars).click
end

Given("I edit member details") do
  o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
  string = (0...10).map { o[rand(o.length)] }.join
  count = 50
  
  @browser.text_field(:xpath => '//input[@id="name"]').set string+"shipt123.com"
  @browser.text_field(:xpath => '//input[@id="name"]').set(:backspace)
end
