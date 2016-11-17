class Person < ApplicationRecord
  after_create :update_gravatar

  def update_gravatar
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    self.gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
    self.save
  end
end
