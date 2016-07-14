require 'rails_helper'

describe Comment, type: :model do
  it 'should be valid' do
    comment = Comment.new(comment: "comment")
    expect(comment).to be_valid
  end

  it 'should be invalid' do
    comment = Comment.new()
    expect(comment).to be_invalid
  end
end
