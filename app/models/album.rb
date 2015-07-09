class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :artist }
  validates :artist, presence: true
  validates :genre, presence: true
  validates :length, presence: true, numericality: { only_integer: true, greater_than: 0 }


private
  def create_album
    c = Albums.new
    c.valid?
    c.save
  end

end
