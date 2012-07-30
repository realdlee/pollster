class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :title
  
  # validates :edit_url, :on => :create
  
  validates :title, presence: true,
                    length: { maximum: 100 },
                    uniqueness: true
  
  has_many :questions
  
  # def create_edit_url(params[:id])
  #     self[:edit_url] = 10.times.map{(97 + rand(25)).chr}.join
  #   
  #   end
  
end
