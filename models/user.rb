class User
  inherit Mongo::Model
  collection :users

  attr_accessor :email

  # validations
  validates_presence_of :email
end