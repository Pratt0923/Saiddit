require 'rails_helper'

RSpec.describe Subreddit, :type => :model do
  it 'should be valid' do
    subreddit = Subreddit.new(name: "new")
    expect(subreddit).to be_valid
  end

  it 'shoudl be invalid' do
    subreddit = Subreddit.new()
    expect(subreddit).to be_invalid
  end
end
