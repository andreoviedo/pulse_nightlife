# == Schema Information
#
# Table name: consumers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  profile_picture        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_consumers_on_email                 (email) UNIQUE
#  index_consumers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Consumer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relationships
  has_many :events_consumers, dependent: :destroy
  has_many :events, through: :events_consumers
  has_many :orders, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :date_of_birth, presence: true
  validate :must_be_over_21

  private

  def must_be_over_21
    if date_of_birth.present? && date_of_birth > 21.years.ago.to_date
      errors.add(:date_of_birth, "must be at least 21 years old")
    end
  end
end
