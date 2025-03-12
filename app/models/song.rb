class Song < ApplicationRecord
  has_one_attached :audio_file
  has_one_attached :image
end
