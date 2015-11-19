class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true,
                       uniqueness: true
  has_many :orders
  enum role: %w(default admin)

  def full_address
    "#{self.address} #{self.city}, #{self.state} #{self.zip}"
  end
end
