class User < ActiveRecord::Base
  belongs_to :story

  validates :mobile, presence: true, uniqueness: true
  # validates_length_of :mobile, :is => 12, :message => "number invalid, please check and try again."

  before_validation(on: :create) do
    self.mobile = mobile.gsub(/[^0-9]/, "") if attribute_present?("mobile")

    if not self.mobile.include? "44"
      self.mobile = mobile.to_i.to_s.prepend('44')
    end
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
