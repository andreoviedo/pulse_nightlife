# == Schema Information
#
# Table name: events_promoters
#
#  id              :bigint           not null, primary key
#  commission_rate :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  event_id        :integer
#  promoter_id     :integer
#
class EventsPromoter < ApplicationRecord
  # Relationships
  belongs_to :event
  belongs_to :promoter

  # Validations
  validates :commission_rate, presence: true, 
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :promoter_id, uniqueness: { scope: :event_id, 
            message: "can only be associated once with an event" }
end
