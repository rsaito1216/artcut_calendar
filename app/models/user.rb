class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :events, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true
  validates :email, format: { with: /[@]/, message: "に@が入力されていません"}
end
