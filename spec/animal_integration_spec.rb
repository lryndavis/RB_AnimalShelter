require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new animal', {:type => :feature}) do
  it('allows a user to add a new animal') do
    visit('/')
    click_link('Add New Animal')
    fill_in('name', :with =>'Sherman')
    fill_in('gender', :with =>'male')
    fill_in('admittance_date', :with =>'01/31/2015')
    fill_in('type', :with =>'dog')
    fill_in('breed', :with =>'Goldendoodle')
    click_button('Add Animal')
    expect(page).to have_content('Welcome')
  end
end

describe("viewing all of the animals", {:type => :feature}) do
  it('allows a user to see a list of the animals') do
    animal = Animal.new({:name => "Sherman", :gender => "male", :admittance_date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :cust_id => 1})
    animal.save()
    visit('/')
    click_link('View All Animals')
    expect(page).to have_content("Sherman")
  end
end
