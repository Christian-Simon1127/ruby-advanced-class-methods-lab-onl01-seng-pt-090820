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
  end
  
  def self.create_by_name(name) 
    self.create
    @name = name 
    self.save
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      true
    else 
      self.create_by_name(name)
    end
  end 
  
  def self.alphabetical
    self.all.sort
  end
  
  def self.new_from_filename(file_name)
    names = file_name.split(" - ")
    more_names = names[1].split(".") 
    @artist_name = names[0]
    @name = more_names[1]
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
    self.save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  
end
