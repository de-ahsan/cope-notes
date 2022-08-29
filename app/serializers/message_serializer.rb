class MessageSerializer < ActiveModel::Serializer
  has_many :subscriber_emails
  has_many :subscribers, through: :subscriber_emails

  attributes :id, :text
end
