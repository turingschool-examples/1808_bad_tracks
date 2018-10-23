require 'rails_helper'

describe 'user index' do
  it 'user can see all songs' do
    artist_1, artist_2 = create_list(:artist, 2)
    song_1 = create(:song, artist: artist_1)
    song_2, song_3 = create_list(:song, 2, artist: artist_2)

    visit songs_path

    expect(page).to have_content("All Songs")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Plays: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Plays: #{song_2.play_count}")
    expect(page).to have_content(song_3.title)
    expect(page).to have_content("Plays: #{song_3.play_count}")
  end
end
