require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create
    song = self.new
    Song.all << song
    song
  end
  def self.new_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name (song_name)
    self.all.find do |song|
      song_name == song.name
    end
  end

  def self.find_or_create_by_name(title)
        if self.find_by_name(title)
          self.find_by_name(title)
        else
          self.create_by_name(title)
        end
  end

  def self.alphabetical
    self.all.sort_by {|song_obj| song_obj.name}
  end

  def self.new_from_filename(song_in_mp3_format)
    split_title = song_in_mp3_format.split(" - ")
    title_mp3=split_title[1]
    split_mp3=title_mp3.split(".")
    song = Song.new_by_name(split_mp3[0])
    Song.find_by_name(split_mp3[0]).artist_name=split_title[0]
    song
  end

  def self.create_from_filename(song_in_mp3_format)
    split_title = song_in_mp3_format.split(" - ")
    title_mp3=split_title[1]
    split_mp3=title_mp3.split(".")
    song = Song.new_by_name(split_mp3[0])
    Song.find_by_name(split_mp3[0]).artist_name=split_title[0]
    song
  end

  def self.destroy_all
    Song.all.clear
  end
end

#Song.new_from_filename("Taylor Swift - Blank Space.mp3")
