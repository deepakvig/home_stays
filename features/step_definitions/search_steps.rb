Given /^I am on the homepage$/ do
  visit(root_url) #pending # express the regexp above with the code you wish you had
end

When /^I press "([^"]*)"$/ do |arg1|
  click_button(arg1) #pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1) # express the regexp above with the code you wish you had
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2) # express the regexp above with the code you wish you had
end

When /^I go to homepage$/ do
  steps %{
    And I am on the homepage
  } 
end

Given /^I have booking records$/ do
  host = Host.create( :ref => "host#1", :name => "Mr Jones", :address => "42 Camden Street")
  room = Room.create( :ref => "room#1", :host_id => 1, :capacity => 2)
  host = Host.create( :ref => "host#2", :name => "Mrs Smith", :address => "2 O'Connell Street")
  room = Room.create( :ref => "room#2", :host_id => 2, :capacity => 1)
  room = Room.create( :ref => "room#3", :host_id => 2, :capacity => 1)
  booking = Booking.create( :ref => "b#1", :room_id => 1, :start_date => "2012-06-01", :end_date => "2012-06-10", :number_of_guests => 1)
  booking = Booking.create( :ref => "b#2", :room_id => 1, :start_date => "2012-06-20", :end_date => "2012-07-01", :number_of_guests => 2)
  booking = Booking.create( :ref => "b#3", :room_id => 2, :start_date => "2012-06-05", :end_date => "2012-06-15", :number_of_guests => 1)
end

Then /^I should see a search result "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end
