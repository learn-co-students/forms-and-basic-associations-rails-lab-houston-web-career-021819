class Song < ActiveRecord::Base
  # add associations here

  belongs_to :artist
  belongs_to :genre

  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(note)
    note.each do |each_note|
        if each_note != ""
      self.notes << Note.find_or_create_by(content: each_note)
        end
    end
  end

  def note_contents
    if self.notes.length > 0
      notes = []
      self.notes.each do |each_note|
        notes << each_note.content
      end
    end
    notes
  end

end
