RSpec.describe Following, type: :model do
  let(:testuser1) do
    User.create(username: 'testuser1', email: 'usertest1@mail.com', fullname: 'user 1', password: 'dfsddfsdfa', id: 1)
  end
  let(:testuser2) do
    User.create(username: 'testuser2', email: 'usertest2@mail.com', fullname: 'user 2', password: 'fdfdfdsdsf', id: 2)
  end
  let(:new_follow) { Following.create(follower_id: testuser1.id, followed_id: testuser2.id) }
  let(:new_follow2) { Following.create(follower_id: testuser1.id, followed_id: testuser2.id) }

  describe 'Follows functionality' do
    it 'Saves new records' do
      new_follow.save
      expect(Following.all.length).to eq(1)
    end

    it 'Saves the follower as follower id ' do
      expect(new_follow.follower_id).to eq(testuser1.id)
    end

    it 'Saves the followed as followed id ' do
      expect(new_follow.followed_id).to eq(testuser2.id)
    end

    it 'Validates a user cannot attempt to follow another already following user' do
      new_follow.save
      new_follow2.save
      expect(new_follow2).to_not be_valid
    end
  end
end
