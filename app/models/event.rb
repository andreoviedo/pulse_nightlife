class Event < ApplicationRecord

  belongs_to :venue, required: true, class_name: "Venue", foreign_key: "venue_id"

  has_many  :events_promoters, class_name: "EventsPromoter", foreign_key: "event_id", dependent: :destroy

  has_many  :events_consumers, class_name: "EventsConsumer", foreign_key: "event_id", dependent: :destroy

  has_many  :orders, class_name: "Order", foreign_key: "event_id", dependent: :destroy
end
