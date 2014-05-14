class Song < ActiveRecord::Base

  def self.itunes_search(query)
    escaped_query = query.downcase.gsub(' ','+')
    query_string = "entity=musicTrack&limit=20&term=#{escaped_query}"
    url = "http://itunes.apple.com/search?#{query_string}"
    raw_response = HTTParty.get(url)
    response = JSON.parse(raw_response)
    # here go to the rails console and figure out what you need to extract from the response...
    # rails c
    # Song.itunes_search("Jack Johnson")
    # Song.itunes_search("Jack Johnson").keys
    # Song.itunes_search("Jack Johnson")['results']
    # Song.itunes_search("Jack Johnson")['results'][0]
    # Song.itunes_search("Jack Johnson")['results'][0].keys
    # Song.itunes_search("Jack Johnson")['results'][0]['artistId']
    # .. and here is the result:
    raw_song = response['results']
    package_songs = raw_song.map do |song|
      {
        :itunes_artist_id => song['artistId'],
        :itunes_song_id => song['trackId'],
        :title => song['trackName'],
        :artwork_url => song['artworkUrl100']
      }
    end
    return package_songs
  end

end
