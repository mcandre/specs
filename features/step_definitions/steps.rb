Given(/^"([^"]*)"$/) do |command|
    @cucumber = `#{command}`
end

Then(/^the output has "([^"]*)"$/) do |text|
    expect(@cucumber).to include(text)
end

Then(/^the output is like "(.+)"$/) do |regex|
    expect(@cucumber).to match(regex)
end
