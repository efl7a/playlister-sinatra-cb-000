class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slugified_name)
    normal_name = slugified_name.gsub('-', ' ').titleize
    self.find_by(name: normal_name)
  end
end
