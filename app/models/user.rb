class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  validates :first_name, :last_name, :phone_number, presence: true
  has_many :projects

  def buyer?
    type == 'Buyer'
  end

  def name
    [first_name, last_name].join(" ")
  end
end
