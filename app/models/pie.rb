class Pie < ActiveRecord::Base

  belongs_to :user
  has_many :activities

  validates :name, :presence => true
  validates :user, :presence => true

  attr_accessible :description, :name

end
