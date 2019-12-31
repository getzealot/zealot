# frozen_string_literal: true

class Api::Apps::VersionExistController < Api::BaseController
  # before_action :validate_user_token
  before_action :validate_channel_key

  def show
    determine_params!

    where_params = channel_params.merge(channel_id: @channel.id)
    raise ActiveRecord::RecordNotFound, '应用版本不存在' unless Release.exists?(where_params)

    render json: Release.find_by(where_params)
  end

  private

  def determine_params!
    return if (channel_params.key?(:bundle_id) && channel_params.key?(:git_commit)) ||
              (channel_params.key?(:bundle_id) && channel_params.key?(:release_version) &&
              channel_params.key?(:build_version))

    raise ActionController::ParameterMissing,
          'Choose bundle_id, release_version, build_version or bundleid_id, git_commit'
  end

  def channel_params
    params.permit(:bundle_id, :release_version, :build_version, :git_commit)
  end
end
