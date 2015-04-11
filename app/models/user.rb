class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pastes, dependent: :destroy
  is_impressionable

  def views
    impressionist_count(filter: :ip_address)
  end
end
