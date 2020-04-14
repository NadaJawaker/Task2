class Submission < ApplicationRecord
  belongs_to :user  
  has_many :submission_runs
#  validates :user_id, presence: true       
  validates :code, presence: true                                           
end   
