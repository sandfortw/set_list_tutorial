require 'rails_helper'

describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 235)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 208, play_count: 500)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the artist for the song'  do
    artist = Artist.create(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 235)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 208, play_count: 500)
    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end

# As a user,
# when I visit '/songs'
# I see each song's title and play count

  describe 'As a user'
  describe "when I visit '/songs'" do
    it "I see each song's title and play count" do
      artist = Artist.create(name: 'Carly Rae Jepsen')

      song_1 = artist.songs.create!(
        title: "I Really Like You",
        length: 208,
        play_count: 243810867)
      song_2 = artist.songs.create!(
        title: "Call Me Maybe",
        length: 199,
        play_count: 1214722172)

        # song_1 = Song.create!(title:       "I Really Like You",
        #   length:      208,
        #   play_count:  243810867)
        # song_2 = Song.create!(title:       "Call Me Maybe",
        #   length:      199,
        #   play_count:  1214722172)


      visit "/songs"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("Play Count: #{song_1.play_count}")
      expect(page).to have_content(song_2.title)
      expect(page).to have_content("Play Count: #{song_2.play_count}")
    end
  end
end