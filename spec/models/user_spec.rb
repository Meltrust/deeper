require 'rails_helper'

RSpec.describe User, type: :model do
  let(:testuser1) do
    FactoryBot.create(:user)
  end
  let(:testuser2) do
    FactoryBot.create(:user, username: 'user2', email: 'usertest2@mail.com')
  end
  let(:invalid_user) do
    FactoryBot.build(:user, username: nil, fullname: 'user inv', email: 'notvalidemail.com')
  end

  describe 'User can be validated' do
    it 'Validates user' do
      expect(testuser1).to be_valid
    end

    it 'Unvalidates user if not valid' do
      expect(invalid_user).to_not be_valid
    end
  end

  describe 'Can follow users' do
    it 'Follows users' do
      testuser1.followeds << testuser2
      follow = testuser1.followeds.include?(testuser2)

      expect(follow).to eq(true)
    end
    it 'Unfollows users' do
      testuser1.followeds << testuser2
      testuser1.followed_users.find_by(followed_id: testuser2).destroy
      follow = testuser1.followeds.include?(testuser2)

      expect(follow).to eq(false)
    end
    it 'Users can submit deeps' do
      testuser1.deeps.create(text: 'hi')

      expect(testuser1.deeps.last.text).to eq('hi')
    end
  end
end
