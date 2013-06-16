class Activity < ActiveRecord::Base
  
  belongs_to :pie
  delegate :user, :to => :pie

  validates :title, :presence => true
  validates :from_time, :presence => true
  validates :until_time, :presence => true

  attr_accessible :description, :from_time, :title, :until_time

end
