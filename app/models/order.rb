class Order < ApplicationRecord

  belongs_to :consumer, required: true, class_name: "Consumer", foreign_key: "consumer_id"

  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"

  belongs_to :table_service, required: true, class_name: "TablePerson", foreign_key: "table_service_id"
end
