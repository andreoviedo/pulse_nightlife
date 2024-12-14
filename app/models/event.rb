# == Schema Information
#
# Table name: events
#
#  id              :bigint           not null, primary key
#  age_restriction :string
#  capacity        :integer
#  description     :text
#  end_time        :datetime
#  image           :string
#  name            :string
#  start_time      :datetime
#  status          :string
#  ticket_link     :string
#  ticket_price    :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  venue_id        :integer
#
class Event < ApplicationRecord

  belongs_to :venue, required: true, class_name: "Venue", foreign_key: "venue_id"

  has_many  :events_promoters, class_name: "EventsPromoter", foreign_key: "event_id", dependent: :destroy

  has_many  :events_consumers, class_name: "EventsConsumer", foreign_key: "event_id", dependent: :destroy

  has_many  :orders, class_name: "Order", foreign_key: "event_id", dependent: :destroy
end
