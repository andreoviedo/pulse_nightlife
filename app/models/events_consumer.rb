# == Schema Information
#
# Table name: events_consumers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  consumer_id :integer
#  event_id    :integer
#
class EventsConsumer < ApplicationRecord
  # Relationships
  belongs_to :event
  belongs_to :consumer

  # Validations
  validates :status, presence: true, inclusion: { in: ["interested", "going"] }
  validates :consumer_id, uniqueness: { scope: :event_id, 
            message: "can only RSVP once to an event" }
end
