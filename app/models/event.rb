# == Schema Information
#
# Table name: events
#
#  id              :bigint           not null, primary key
#  age_restriction :string
#  capacity        :integer
#  date            :datetime
#  description     :text
#  end_time        :datetime
#  image           :string
#  name            :string
#  price           :decimal(, )
#  start_time      :datetime
#  status          :string
#  ticket_link     :string
#  ticket_price    :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  venue_id        :integer
#
class Event < ApplicationRecord
  # Relationships
  belongs_to :venue
  has_many :events_promoters, dependent: :destroy
  has_many :promoters, through: :events_promoters
  has_many :events_consumers, dependent: :destroy
  has_many :consumers, through: :events_consumers
  has_many :orders, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  validate :capacity_cannot_exceed_venue_capacity

  private

  def capacity_cannot_exceed_venue_capacity
    if capacity && venue && capacity > venue.capacity
      errors.add(:capacity, "cannot exceed venue capacity")
    end
  end
end
