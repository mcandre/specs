Given(/^"([^"]*)"$/) do |command|
  @cucumber = `#{command}`
end

Then(/^the output has "([^"]*)"$/) do |text|
  @cucumber.should include text
end
