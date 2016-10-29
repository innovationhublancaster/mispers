class User < ActiveRecord::Base
  has_one :story

  validates :mobile, presence: true

  before_validation(on: :create) do
    self.mobile = number.gsub(/[^0-9]/, "") if attribute_present?("mobile")
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
 end
end
