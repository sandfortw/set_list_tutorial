require 'rails_helper'

describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average _song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title:'Purple Rain', length: 845, play_count: 8999)
        @beret = @prince.songs.create!(title:'Raspberry Rainret', length: 847, play_count: 100)
      end
      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(846.00)
      end
    end
  end
end