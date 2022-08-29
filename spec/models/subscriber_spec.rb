require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  let(:subscriber) { Subscriber.create(name: 'example name', email: 'example@test.com') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:email).is_at_most(50) }

    it { should have_many(:subscriber_emails) }
    it { should have_many(:messages).through(:subscriber_emails) }
  end
end