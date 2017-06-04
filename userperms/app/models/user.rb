class User < ApplicationRecord
  belongs_to :authentication_method
  has_and_belongs_to_many :roles
end
