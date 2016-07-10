describe ReplyPolicy do
 it 'lets users do something' do
   post = create :post
   user = create :user
   create :comment
   reply = create :reply
   p = ReplyPolicy.new(user, reply)
   expect(p.destroy?).to eq(true)
   expect(p.edit?).to eq(true)
   expect(p.update?).to eq(true)
 end
end
