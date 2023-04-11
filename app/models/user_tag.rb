class UserTag < ApplicationRecord
  belongs_to :data_type
  belongs_to :data_level
  belongs_to :user

  has_many :user_tag_locations, dependent: :destroy
end