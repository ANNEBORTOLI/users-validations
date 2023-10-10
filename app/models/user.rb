class User < ApplicationRecord
  validates :name, :email, :cpf, :phone, presence: true
  validates :name, length: { minimum: 2 }
  validates :cpf, uniqueness: true
  validates :phone, phone: { possible: true, allow_blank: false }, uniqueness: false
  validates :email, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }

  validate :validate_cpf_format
  before_save :phone_format

  private

  def validate_cpf_format
    errors.add(:cpf, 'is not a valid') unless CPF.valid?(cpf, strict: true)
  end

  def phone_format
    self.phone = Phonelib.parse(phone).e164
  end
end
