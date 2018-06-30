# frozen_string_literal: true

class InquiryDeliveryJob < ApplicationJob
  queue_as :default

  def perform(inquiry)
    inquiry_delivery = MovuTransceiver.new(inquiry)
    inquiry_delivery.post
    inquiry_delivery.received
  end
end
