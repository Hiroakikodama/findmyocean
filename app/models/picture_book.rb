class PictureBook < ApplicationRecord
  belongs_to :user
  attachment :image
end
