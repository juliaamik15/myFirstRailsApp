class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product, touch: true

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  after_commit { CommentUpdateJob.perform_later(self, @user) }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
end
