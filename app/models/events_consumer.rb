class EventsConsumer < ApplicationRecord


  belongs_to :consumers, required: true, class_name: "Consumer", foreign_key: "consumers_id"


  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
end
