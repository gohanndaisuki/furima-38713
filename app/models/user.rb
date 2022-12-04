class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
  validates :nickname, :birth_date,  presence: true
  validates :last_name,              presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ヶ]/ } # ユーザー本名全角の正規表現
  validates :last_name_kana,         presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :first_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ヶ]/ } # ユーザー本名全角の正規表現
  validates :first_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
end
