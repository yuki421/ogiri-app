class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  with_options presence: true do
    validates :title
    validates :image
    validates :category_id , numericality: { other_than: 0 }
  end

end
