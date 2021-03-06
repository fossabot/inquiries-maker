# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :omniauthable, :recoverable,
  devise :database_authenticatable, :trackable, :validatable, :rememberable, :timeoutable, :registerable
  has_many :messages, class_name: 'Ahoy::Message', as: :user, dependent: :destroy, inverse_of: :user

  def self.invoice_open_dates(quarter)
    subject = "UOS Invoice #{quarter}"
    dates = Ahoy::Message.where(subject: subject).map(&:opened_at).compact
    dates.map! { |date| date.to_s(:swiss_date_format_with_time) }
  end

  def account_active?
    # blocked_at.nil?
    # TODO: add column blocked_at to database and replace
    self == User.first
  end

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :locked
  end
end
