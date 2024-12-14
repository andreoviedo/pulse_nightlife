# == Schema Information
#
# Table name: events_promoters
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#  promoter_id :integer
#
class EventsPromoter < ApplicationRecord

  belongs_to :promoter, required: true, class_name: "Promoter", foreign_key: "promoter_id"

  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
end
