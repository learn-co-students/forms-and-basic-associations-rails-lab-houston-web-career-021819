class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre= Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def notes_1=(name)
    Note.create(song: self, content: name)
  end

  def notes_2=(name)
    Note.create(song: self, content: name)
  end

  def note_contents
    self.notes.map {|x| x.content}
  end

  def note_contents=(note_array)
    #byebug
    note_array.each do |note|
      if note != ''
        #byebug
        new_note = Note.create(song: self, content: note)
        self.notes << new_note
      end
    end
    #byebug
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  # def song_notes_1
  #   self.notes ? self.notes : nil
  # end

end
