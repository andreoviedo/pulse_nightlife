class Promoter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  has_many  :events_promoters, class_name: "EventsPromoter", foreign_key: "promoter_id", dependent: :destroy
end
