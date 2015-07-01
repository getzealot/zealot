class Release < ActiveRecord::Base
  belongs_to :app

  before_create :auto_release_version

  def filesize
    fileext = case app.device_type.downcase
    when 'iphone', 'ipad', 'ios'
      '.ipa'
    when 'android'
      '.apk'
    end

    File.size(File.join(
      "public/uploads/apps",
      app.user.id.to_s,
      app_id.to_s,
      "#{id.to_s}#{fileext}"
    ))
  end


  private
    def auto_release_version
      latest_version = Release.where(app_id:self.app_id).last
      self.version = latest_version ? (latest_version.version + 1) : 1
    end
end
