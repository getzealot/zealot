class WebHooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel
  before_action :set_web_hook, except: [:create]

  def create
    @web_hook = WebHook.new(web_hook_params)
    @channel.web_hooks << @web_hook

    authorize @web_hook
    return redirect_to_channel_url unless @web_hook.save

    redirect_to_channel_url notice: '网络钩子创建成功'
  end

  def destroy
    @web_hook.destroy
    redirect_to_channel_url notice: '网络钩子已经成功删除'
  end

  def disable
    @channel.web_hooks.delete @web_hook
    redirect_to_channel_url notice: '网络钩子已经取消启用'
  end

  def enable
    @web_hook.channels << @channel
    redirect_to channel_url(@channel, anchor: 'enabled'), notice: '网络钩子已经成功启用'
  end

  def test
    event = params[:event] || 'upload_events'
    AppWebHookJob.perform_later event, @web_hook, @channel
    redirect_to_channel_url notice: '网络钩子请求测试已发送'
  end

  private

  def set_channel
    @channel = Channel.friendly.find(params[:channel_id])
  end

  def set_web_hook
    @web_hook = WebHook.find(params[:id])
    authorize @web_hook
  end

  def web_hook_params
    params.require(:web_hook).permit(
      :channel_id, :url, :body,
      :upload_events, :changelog_events, :download_events
    )
  end

  def redirect_to_channel_url(**options)
    redirect_to channel_path(@channel), **options
  end
end
