describe ApplicationPolicy do
  it 'lets users view the application' do
    post = create :post
    user = create :user
    p = ApplicationPolicy.new(user, post)
  end
end
