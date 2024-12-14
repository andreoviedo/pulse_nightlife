# == Schema Information
#
# Table name: promoters
#
#  id                     :bigint           not null, primary key
#  company_name           :string
#  description            :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  instagram_handle       :string
#  logo                   :string
#  name                   :string
#  phone_number           :integer
#  profile_picture        :string
#  promoter_type          :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  social_media_links     :text
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_promoters_on_email                 (email) UNIQUE
#  index_promoters_on_reset_password_token  (reset_password_token) UNIQUE
#
class Promoter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :instagram_handle, presence: true, uniqueness: true
end
