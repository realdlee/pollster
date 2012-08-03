class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :title
  
  
  # validates :edit_url, :on => :create
  
  validates_presence_of :title
  validates_length_of :title, :within => 3..50, :on => :create, :message => "must be present"
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
  
  has_many :questions, :dependent => destroy
  
  # before_create :create_edit
  # 
  # private
  # 
  # def create_edit_url(params[:id])
  #   self[:edit_url] = 10.times.map{(97 + rand(25)).chr}.join
  # end
  
end


