class User < ApplicationRecord
  has_many :todo_lists, :dependent => :destroy
  has_secure_password
end
