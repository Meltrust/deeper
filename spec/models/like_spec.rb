RSpec.describe Like, type: :model do
  let(:testuser1) do
    User.create(username: 'testuser1', email: 'usertest1@mail.com', fullname: 'user 1', password: 'dfsddfsdfa', id: 1)
  end
  let(:testuser2) do
    User.create(username: 'testuser2', email: 'usertest2@mail.com', fullname: 'user 2', password: 'fdfdfdsdsf', id: 2)
  end

  let(:new_deep) { Deep.create(user_id: testuser1.id, text: 'hi') }
  let(:new_like) { Like.create(deep_id: new_deep.id, user_id: testuser2.id) }
  let(:new_like2) { Like.new(deep_id: testuser1.id, user_id: testuser2.id) }

  describe 'Follows functionality' do
    it 'A user can like a deep' do
      new_deep.save
      new_like.save
      expect(Like.all.length).to eq(1)
    end

    it 'A user can remove an issued like' do
      new_deep.save
      new_like.save
      new_like.destroy

      expect(Like.all.length).to eq(0)
    end

    it 'Cannot save a like twice from same user and deep' do
      new_deep.save
      new_like.save
      new_like2.save
      expect(new_like2.id).to be nil
    end
  end
end
