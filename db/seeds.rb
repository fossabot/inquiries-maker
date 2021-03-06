# frozen_string_literal: true

if Rails.env.development?
  User.create!([
                 { email: 'test@test.com', password: '123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: '2018-05-13 16:13:50', last_sign_in_at: '2018-05-13 16:13:50', current_sign_in_ip: '::1', last_sign_in_ip: '::1' }
               ])
  require 'faker'
  require 'factory_bot_rails'
  5.times do |i|
    i += 3 * rand(999)
    FactoryBot.create(:moving_inquiry, client_email: "person#{i}@fake.com", client_property_size: %w[size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8].sample)
    sleep 0
  end

  5.times do |i|
    i += 3 * rand(999)
    FactoryBot.create(:cleaning_inquiry, client_email: "person#{i}@fake.com", client_property_size: %w[size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8].sample)
    sleep 0
  end

  5.times do |i|
    i += 3 * rand(999)
    FactoryBot.create(:combined_inquiry, client_email: "person#{i}@fake.com", client_property_size: %w[size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8].sample)
    sleep 0
  end
end
# # ActiveRecord::Base.transaction do
# # end
