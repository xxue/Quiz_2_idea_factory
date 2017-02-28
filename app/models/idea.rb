class Idea < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user
  #  optional: true

  # lambda { order(created_at: :desc) },

  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true



end
