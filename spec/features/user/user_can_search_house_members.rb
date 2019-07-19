require 'rails_helper'

describe 'A registered user' do
  it 'can search members of a house' do
    # As a user (visitor)
    # When I visit "/"
    visit root_path
    # And I select "Greyjoy" from the dropdown
    # find('#dropdown-list', :text => 'Greyjoy').click
    # And I click on "Get Members"
    click_on "Greyjoy"
    # Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq('/search')
    # expect(params).to eq("house=greyjoy")
    expect(page).to have_current_path(search_path(house: 'greyjoy'))
    # And I should see a message "7 Members"
    expect(page).to have_content("7 Members")
    # And I should see a list of the 7 members of House Greyjoy
    # And I should see a name and id for each member.
    within('#house_members') do
        within(first('.member')) do
          expect(page).to have_content('Balon Greyjoy')
          expect(page).to have_content('38')
        end
        within('.member:nth-child(2)') do
          expect(page).to have_content('Alannys Greyjoy')
          expect(page).to have_content('39')
        end
        within('.member:nth-child(3)') do
          expect(page).to have_content('Rodrik Greyjoy')
          expect(page).to have_content('40')
        end
        within('.member:nth-child(4)') do
          expect(page).to have_content('Maron Greyjoy')
          expect(page).to have_content('41')
        end
        within('.member:nth-child(5)') do
          expect(page).to have_content('Yara Greyjoy')
          expect(page).to have_content('42')
        end
        within('.member:nth-child(6)') do
          expect(page).to have_content('Theon Greyjoy')
          expect(page).to have_content('43')
        end
        within('.member:nth-child(7)') do
          expect(page).to have_content('Euron Greyjoy')
          expect(page).to have_content('44')
        end
      end
  end
end
