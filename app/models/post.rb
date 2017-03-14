class Post < ApplicationRecord
	acts_as_votable

	validates :user_id, presence: true
	validates :image, presence: true
	validates :caption, length: { minimum: 3, maximum: 300 }
	
	has_many :comments, dependent: :destroy
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
