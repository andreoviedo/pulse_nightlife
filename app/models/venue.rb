# == Schema Information
#
# Table name: venues
#
#  id                     :bigint           not null, primary key
#  address                :string
#  amenities              :text
#  capacity               :integer
#  description            :string
#  display_picture        :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  images                 :string
#  name                   :string
#  opening_hours          :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  social_media_links     :text
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  promoter_admin_id      :integer
#
# Indexes
#
#  index_venues_on_email                 (email) UNIQUE
#  index_venues_on_reset_password_token  (reset_password_token) UNIQUE
#
class Venue < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relationships
  has_many :events, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }
end
