class User < ApplicationRecord
validates :name, presence: true

  has_many :dogs
  has_many :walks, through: :dogs

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth['info']['email']
    end
  end

end
