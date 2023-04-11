class User < ApplicationRecord
  has_many :user_tags
  has_many :user_permissions
  
  serialize :sso_payload
end