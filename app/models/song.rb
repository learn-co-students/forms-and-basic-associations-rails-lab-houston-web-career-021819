class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    self.notes ? self.notes.map{|x| x.content} : nil
  end

  def note_contents=(comments)
    #byebug
    if comments
      comments.each do |comment|
        if comment != ''
          new_note = Note.create(song: self, content: comment)
          self.notes << new_note
        end
      end
    end
  end
end
