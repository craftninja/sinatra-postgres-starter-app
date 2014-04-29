require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do

  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario 'User can see the animals page, add animals' do
    visit '/'
    click_on 'Animals'
    click_on 'Add'
    fill_in 'Animal Name', with: 'zebra'
    click_on 'add'
    expect(page).to have_content('zebra')
  end

end
