require 'rails_helper'

RSpec.describe Reply, :type => :model do

  it 'should be valid' do
    reply = Reply.new(
    content: "content"
    )
    expect(reply).to be_valid
  end

  it 'should not be valid' do
    reply = Reply.new()
    expect(reply).to be_invalid
  end

end
