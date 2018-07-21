# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :tasks
  has_many :users
  belongs_to :user, optional: true
end
