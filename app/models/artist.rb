class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs, source: :song_genres

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slugified_name)
    normal_name = slugified_name.gsub('-', ' ').titleize
    self.find_by(name: normal_name)
  end
end
