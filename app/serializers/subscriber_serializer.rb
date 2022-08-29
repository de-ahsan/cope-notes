class SubscriberSerializer < ActiveModel::Serializer
  has_many :subscriber_emails
  has_many :messages, through: :subscriber_emails

  attributes :name, :email, :is_active
end
