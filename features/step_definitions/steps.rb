Given(/^"([^"]*)"$/) do |command|
  @cucumber = `#{command}`
end

Then(/^the output has "([^"]*)"$/) do |text|
  @cucumber.include?(text).should == true
end
