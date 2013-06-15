class Pie < ActiveRecord::Base

  belongs_to :user

  validates :name, :presence => true
  validates :user, :presence => true

  attr_accessible :description, :name

end
