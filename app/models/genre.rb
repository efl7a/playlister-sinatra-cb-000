class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slugified_name)
    normal_name = slugified_name.gsub('-', ' ').titleize
    self.find_by(name: normal_name)
  end
end
