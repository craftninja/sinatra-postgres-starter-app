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

  scenario 'User can see animal show page' do
    visit '/'
    click_on 'Animals'
    click_on 'Add'
    fill_in 'Animal Name', with: 'pangolin'
    click_on 'add'
    click_on 'pangolin'
    expect(page).to have_content('pangolin')
  end

  scenario 'User can edit animals' do
    visit '/'
    click_on 'Animals'
    click_on 'Add'
    fill_in 'Animal Name', with: 'baaadger'
    click_on 'add'
    click_on 'baaadger'
    click_on 'Edit'
    fill_in 'Animal Name', with: 'badger'
    click_on 'update'
    expect(page).to have_content('badger')
  end

  scenario 'User can delete animals' do
    visit '/'
    click_on 'Animals'
    click_on 'Add'
    fill_in 'Animal Name', with: 'shrew'
    click_on 'add'
    click_on 'shrew'
    click_on 'delete'
    expect(page).to have_no_content('shrew')
  end

end
