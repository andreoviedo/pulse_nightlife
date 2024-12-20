# == Schema Information
#
# Table name: table_people
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
#  venue_id               :integer
#
# Indexes
#
#  index_table_people_on_email                 (email) UNIQUE
#  index_table_people_on_reset_password_token  (reset_password_token) UNIQUE
#
class TablePerson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :orders, class_name: "Order", foreign_key: "table_service_id", dependent: :destroy
end
