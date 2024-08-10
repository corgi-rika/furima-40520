class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    puts @comment.inspect
    return unless @comment.save

    @item = Item.find(params[:item_id]) # 追加：コメントが関連するアイテムを取得
    CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user } # 特定のアイテムに紐づいたチャネルにブロードキャスト
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
