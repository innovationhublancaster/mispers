class Story < ActiveRecord::Base
  has_many :messages
  has_many :users
end