Given(/^I have the topics titled (.+)$/) do |titles|
  titles.split(", ").each do |title|
    Topic.create(:title => title)
  end
end

When(/^I visit the list of topics$/) do
  visit(topics_path)
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.should have_content(text)
end

Given(/^I have no topics$/) do
  Topic.delete_all
end

Given(/^I am on de list of topics$/) do
  visit(topics_path)
end

When(/^I click on "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I fill in the "(.*?)" with "(.*?)"$/) do |input, text|
  fill_in input, :with => text
end

When(/^I click the button "(.*?)"$/) do |link|
  click_button(link)
end

Then(/^I should have (\d+) topic$/) do |count|
  Topic.count.should == count.to_i
end