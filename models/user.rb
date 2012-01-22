class User
  inherit Mongo::Model
  collection :users

  attr_accessor :email, :created_at, :uid, :name, :password_digest

  assign :name, String, true
  assign :email, String, true
  assign :created_at, DateTime, true
  assign :uid, Integer, true
  assign :password_digest, String, true

  # validations
  validates_presence_of :email
end