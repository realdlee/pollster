class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text
  
  validates :text, presence: true,
                   length: { maximum: 100 }
  
  belongs_to :poll
end
