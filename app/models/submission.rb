class Submission < ApplicationRecord
  belongs_to :user  

  validates :user_id, presence: true       
  validates :code, presence: true                                           
end   
