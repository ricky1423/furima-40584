class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :nickname, presence: { message: 'は必ず入力してください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :name_first
    validates :name_second
  end

  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: 'は全角カナを使用してください' } do
    validates :name_first_kana
    validates :name_second_kana
  end

  validates :birth_day, presence: { message: 'は必ず入力してください' }
end
