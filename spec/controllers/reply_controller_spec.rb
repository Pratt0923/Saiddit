require 'rails_helper'

describe ReplyController do
  it 'lets users create replies' do

  end

end


# def create
#     @comment = Comment.find_by(id: params[:comment_id])
#     @reply = Reply.new(content: params[:reply][:content], comment_id: @comment.id)
#     @reply.user = current_user.email.gsub /@.+/, ''
#     @reply.save
#     redirect_to post_comment_index_path
#   end
