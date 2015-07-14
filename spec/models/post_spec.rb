require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_many :comments }
end

describe 'comments' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:post) { Post.create message: 'Chicago!' }
    let(:comment_params) { { comments: 'windy' } }

    subject(:comment) { post.comments.build_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
