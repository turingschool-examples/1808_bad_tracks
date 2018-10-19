require 'rails_helper'

describe 'user can create an artist' do
  it 'when visiting /artists/new' do
 # When I visit "/artists/new"
    visit new_artist_path
   # Then I see a form where I can create a new artist`
   # And I fill in name
    artist_name = "Nickleback"

    fill_in 'artist[name]', with: artist_name
   # And I click "Create Artist"
    click_on "Create Artist"
    new_artist = Artist.last
   # Then I am taken to the show page for the new artist`
    expect(page).to have_content(artist_name)
    expect(current_path).to eq(artist_path(new_artist))
  end
end
