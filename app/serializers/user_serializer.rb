# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role,
             :full_name, :isadmin,
             :address, :dob, :user_id,
             :profile_picture, :salary
end
