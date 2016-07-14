require 'rails_helper'

describe Post, type: :model do

  it 'should be valid' do
    post = Post.new(
    title: "title",
    content: "content"
    )
    expect(post).to be_valid
  end

  it 'should not be valid' do
    post = Post.new()
    expect(post).to be_invalid
  end
end
