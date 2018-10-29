require 'rails_helper'

RSpec.describe 'User can add songs to cart' do
  it 'shows a flash message when a user adds a song' do
    artist = Artist.create(name:'Rick Astley')
    song = artist.songs.create(
      title: 'Never Gonna Give You Up',
      length: 100,
      play_count: 1_000_000_000)

    visit songs_path

    click_button 'Add Song'

    expect(page).to have_content("You have 1 copy of #{song.title} in your cart")
  end
  it 'shows a flash message when a user adds a song again' do
    artist = Artist.create(name:'Rick Astley')
    song = artist.songs.create(
      title: 'Never Gonna Give You Up',
      length: 100,
      play_count: 1_000_000_000)

    visit songs_path

    click_button 'Add Song'

    visit songs_path

    click_button 'Add Song'

    expect(page).to have_content("You have 2 copies of #{song.title} in your cart")
  end
  it 'shows our cart quantity in the nav area' do
    artist = Artist.create(name:'Rick Astley')
    song = artist.songs.create(
      title: 'Never Gonna Give You Up',
      length: 100,
      play_count: 1_000_000_000)

    visit songs_path
    expect(page).to have_content("Cart: 0")
    click_button 'Add Song'

    visit songs_path
    expect(page).to have_content("Cart: 1")
    click_button 'Add Song'

    visit songs_path
    expect(page).to have_content("Cart: 2")
  end
end
