class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_images, dependent: :destroy, autosave: true

  accepts_attachments_for :diary_images, attachment: :image

  validates :title, presence: true
  validates :body, presence: true
end
