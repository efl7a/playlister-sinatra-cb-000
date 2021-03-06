class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    name = slug.gsub('-', ' ').titleize
    name = self.uncap(name)
    self.find_by(name: name)
  end

  def self.uncap(str)
    no_cap_words = ['a', 'with', 'or', 'and', 'the', 'to', 'of', 'by', 'from', 'on', 'in']
    str_array = str.split(' ').map.with_index do |word, i|
      if no_cap_words.include?(word.downcase) && i != 0
        word.downcase
      else
        word
      end
    end
    str_array.join(' ')
  end
end
