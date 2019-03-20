class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name:name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end   

  def note_contents=(content)
    content.each do |each_content|
      if !each_content.empty?
      self.notes << Note.find_or_create_by(content:each_content)
      end
    end
      self.notes
    #byebug
  end

  def note_contents
    content = []
    self.notes.each do |note|
     content << note.content
    end

    content
  end


end
 