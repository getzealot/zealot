class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.order('timestamp DESC').page(params[:page])
  end

  def image
    @message = Message.find(params[:id])
    send_data Base64.decode64(@message.file), type: 'image/png', disposition: 'inline'
  end

  def destroy
    @message = Message.find(params[:id])
    if @message
      is_soft = params.fetch('is_soft', false)

      url = 'http://api.im.qyer.com/v1/im/history/remove.json'
      params = {
        key: '2WcCvCk0FxNt50LnbCQ9SFcACItvuFNx',
        msg_ids: @message.im_id,
      }

      r = RestClient.post url, params
      data = JSON.parse(r)
      if data['meta']['code'] == 200
        flash[:notice] = '最新聊天记录已刷新'

        @message.is_deleted = 1
        @message.save

        redirect_to action: :show
      else

        flash[:notice] = '删除失败，原因：'
        redirect_to action: :show
      end
    else
      flash[:error] = '未找到该消息'
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
  end
end
