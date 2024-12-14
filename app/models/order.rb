# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  consumer_id      :integer
#  event_id         :integer
#  table_service_id :integer
#
class Order < ApplicationRecord
  # Relationships
  belongs_to :event
  belongs_to :consumer

  # Validations
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: ["pending", "confirmed", "completed"] }
  validate :total_price_matches_calculation
  validate :tickets_available

  private

  def total_price_matches_calculation
    if total_price != (quantity * event.price)
      errors.add(:total_price, "must equal quantity times event price")
    end
  end

  def tickets_available
    return unless event && quantity

    total_tickets_sold = event.orders.sum(:quantity)
    tickets_remaining = event.capacity - total_tickets_sold

    if quantity > tickets_remaining
      errors.add(:quantity, "exceeds available tickets")
    end
  end
end
