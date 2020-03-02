class Article < ApplicationRecord
	belongs_to :user
	has_many :comments
	validates :title, presence: true, length: {minimum: 1, maximum: 100}
	validates :description, presence: true, length: {minimum: 1, maximum: 3000}
	validates :user_id, presence: true
end
