require 'rails_helper'

describe Vote do
    before do
      topic =Topic.create(name: "validation met")
      user = User.new(email: "admin@example.com", password: "password")
      user.skip_confirmation!
      user.save!
       @post = Post.create!(user: user, topic: topic, title: 'post title', body: 'post body needs to be longer')
    end

  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        pos_vote = @post.votes.create(value: 1)
        neg_vote = @post.votes.create(value: - 1)
        bad_vote = @post.votes.create(value: 2)
        expect( pos_vote.valid? ).to be_truthy
        expect( neg_vote.valid? ).to be_truthy
        expect( bad_vote.valid? ).to be_falsey
      end
    end
  end
end