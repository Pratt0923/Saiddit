describe PostPolicy do
  it 'it lets users destory or edit posts' do
    post = create :post
    user = create :user
    p = PostPolicy.new(user, post)
    expect(p.destroy?).to eq(true)
    expect(p.edit?).to eq(true)
    expect(p.update?).to eq(true)
  end

  
end
