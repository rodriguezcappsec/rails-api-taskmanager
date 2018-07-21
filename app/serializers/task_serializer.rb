# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :due_date, :status, :user_id
end
