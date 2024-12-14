class Consumer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :events_consumers, class_name: "EventsConsumer", foreign_key: "consumers_id", dependent: :destroy
  has_many  :orders, class_name: "Order", foreign_key: "consumer_id", dependent: :destroy
end
