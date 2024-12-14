# == Schema Information
#
# Table name: events_consumers
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  consumers_id :integer
#  event_id     :integer
#
class EventsConsumer < ApplicationRecord


  belongs_to :consumers, required: true, class_name: "Consumer", foreign_key: "consumers_id"


  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
end
