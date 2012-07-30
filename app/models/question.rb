class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text
  
  validates :text, presence: true
  
  belongs_to :poll #, :dependent => destroy
end
