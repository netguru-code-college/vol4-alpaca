# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name,
            :description,
            presence: true

  has_many :alpaca_events
  has_many :alpacas, through: :alpaca_events
  belongs_to :category
  belongs_to :user
end
