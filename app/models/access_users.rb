class AccessUsers < ActiveRecord::Base
  before_save :encrypt_pass

  def self.authenticate(login, pass)
    AccessUsers.where("name='#{login}' and pass='#{Digest::SHA2.hexdigest(pass)}'").first
  end

  private
  def encrypt_pass
    self.pass = Digest::SHA2.hexdigest(self.pass)
  end
end
