class Article < ApplicationRecord
  # atricle title validation where it shold be always there and it min length shoud be 5 chars
  has_many :comments, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 5}
end
