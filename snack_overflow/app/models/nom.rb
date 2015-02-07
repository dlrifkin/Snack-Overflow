class Nom < ActiveRecord::Base

  include Scoring

  belongs_to :user

  has_many :nom_tags
  has_many :tags, through: :nom_tags

  has_many :comments

  has_many :votes, as: :votable
  has_many :tags, as: :tagable

  validates :title, presence: true
  validates :review, presence: true
  validates :pic_url, presence: true
  # validates :user_id, presence: true


  def self.vend_ten
    @noms = Nom.all.sort {|a,b| a.score <=> b.score}.reverse
    @noms[0..10]
  end

  def self.rand_nom
    @nom = Nom.all.sample
  end

end
