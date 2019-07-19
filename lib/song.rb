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
    song.save 
    song
  end  

  def self.new_by_name(name)
    song = self.create 
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
    # logic behind it
    # self.all.each do |song|
    #   if(name == song.name)
    #     return song
    #   end
    # end
    # return false 
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    a = file_name.split("-")
    b = a[0].strip
    
    x = a[1].split(".mp3")
    y = x[0].strip

    song = self.create_by_name(y)
    song.artist_name = b 
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all = []
  end

end

# binding.pry