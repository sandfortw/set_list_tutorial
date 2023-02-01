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
end