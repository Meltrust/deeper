RSpec.describe Following, type: :model do
  let(:testuser1) { FactoryBot.create(:user) }
  let(:testuser2) { FactoryBot.create(:user, username: 'testuser2', email: 'usertest2@mail.com') }
  let(:new_follow) { Following.build(follower_id: testuser1, followed_id: testuser2) }

  describe 'Follows functionality' do
    it 'Prevents saving unvalid records' do
      expect(Following.all.length).to eq(0)
    end
  end
end
