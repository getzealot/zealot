# frozen_string_literal: true

class Scheme < ApplicationRecord
  belongs_to :app
  has_many :channels, dependent: :destroy
  accepts_nested_attributes_for :channels

  validates :name, presence: true

  def app_name
    "#{app.name} #{name}"
  end

  def latest_channel
    channels.take
  end

  def total_releases
    channels.count
  end
end
