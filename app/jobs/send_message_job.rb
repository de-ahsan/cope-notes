# frozen_string_literal: true

class SendMessageJob < ActiveJob::Base
  # The name of the queue to put this job into
  queue_as :default

  def perform
    subscribers = Subscriber.active
    subscribers.each do |subscriber|
      messages_ids = SubscriberEmail.where(subscriber: subscriber).pluck(:message_id).uniq
      available_messages = Message.where.not(id: messages_ids)
      if available_messages.present?
        message_to_send = available_messages.sample
        SubscriberEmail.create(subscriber: subscriber, message: message_to_send)
        MessageMailer.with(subscriber: subscriber, message: message_to_send).new_message_email.deliver_now
      end
    end
  end
end
