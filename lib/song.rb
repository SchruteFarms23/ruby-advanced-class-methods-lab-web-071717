class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #put self infront so only Class can access this method
  	song = Song.new #creates a new instance of a song
  	song.save       #saves the new instance of the song by calling on save method
  	song #returns song
  end

  def self.new_by_name(song_name) 
  	song = Song.new #creates new instance of song
  	song.name = song_name #makes the instance or new song's name = to name put in argument. Works because name has a writer method.
  	song #returns song
 end

def self.create_by_name(song_name)
	song = Song.new
	song.name = song_name
	song.save
	song
end

def self.find_by_name(song_name)
	self.all.find{|song| song.name == song_name} # invokes self.all method (which returns the @@all array) then uses that to find an instance of a song whose name is equal to the name in argument.
end

def self.find_or_create_by_name(song_name)
	self.create_by_name(song_name)
	self.find_by_name(song_name)
end

def self.alphabetical
	self.all.sort_by {|el| el.name}
end

def self.new_from_filename(file)
	song = Song.new
  file_name = file.split(/[-.]/)[1].chomp(' ')
  song.artist_name = file.split(/[-.]/)[0].chomp(' ')
  file_name.slice!(0)
	song.name = file_name
  song.save
  song
  # binding.pry
end

def self.create_from_filename(file)
  song = Song.new
  file_name = file.split(/[-.]/)[1].chomp(' ')
  song.artist_name = file.split(/[-.]/)[0].chomp(' ')
  file_name.slice!(0)
  song.name = file_name
  song.save
  song
  end

def self.destroy_all
  @@all.clear
end



	


end
