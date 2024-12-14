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

  belongs_to :consumer, required: true, class_name: "Consumer", foreign_key: "consumer_id"

  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"

  belongs_to :table_service, required: true, class_name: "TablePerson", foreign_key: "table_service_id"
end
