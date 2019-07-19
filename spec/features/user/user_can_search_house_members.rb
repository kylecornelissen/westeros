require 'rails_helper'

describe 'A registered user' do
  it 'can search members of a house' do
    # As a user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit "/"
    visit root_path
    # And I select "Greyjoy" from the dropdown
    find('#dropdown-list option', :text => 'Greyjoy').click
    # And I click on "Get Members"
    click_on "Get Members"
    # Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq('/search')
    # expect(params).to eq("house=greyjoy")
    expect(page).to have_current_path(people_path(house: 'greyjoy'))
    # And I should see a message "7 Members"
    expect(page).to have_content("7 Members")
    # And I should see a list of the 7 members of House Greyjoy
    # And I should see a name and id for each member.
    within('#house_members') do
        within(first('.member')) do
          expect(page).to have_content('')
          expect(page).to have_content('')
        end
        within('.member:nth-child(1)') do
          expect(page).to have_content('')
          expect(page).to have_content('')
        end
        within('.member:nth-child(2)') do
          expect(page).to have_content('')
          expect(page).to have_content('')
        end
        within('.member:nth-child(3)') do
          expect(page).to have_content('')
          expect(page).to have_content('')
        end
      end
  end
end
