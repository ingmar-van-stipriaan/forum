class Topic < ActiveRecord::Base

  belongs_to :user
  has_many :messages, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :user_id, :default => 1
end
