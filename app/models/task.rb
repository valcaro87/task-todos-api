class Task < ApplicationRecord
  include ActiveModel::Serialization

  attr_accessor :previous_id
  serialize :previous_id

  attr_accessor :next_id
  serialize :next_id

  def next_id
    Task.where("id > ?", self.id)&.first&.id || Task&.first&.id
  end

  def previous_id
    Task.where("id < ?", self.id)&.last&.id || Task&.last&.id
  end

end
