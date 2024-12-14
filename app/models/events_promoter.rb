class EventsPromoter < ApplicationRecord

  belongs_to :promoter, required: true, class_name: "Promoter", foreign_key: "promoter_id"

  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
end
