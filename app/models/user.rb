class User < ApplicationRecord
  validates :name, :email, :cpf, :phone, presence: true
  validates :name, length: { minimum: 2 }
  validates :cpf, uniqueness: true
  validates :phone, phone: { possible: true, allow_blank: false, types: [:voip, :mobile], countries: :br }, uniqueness: false
  validates :email, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validate :valid_cpf?
  before_save :phone_formatter, :email_formatter, :cpf_formatter

  private

  def valid_cpf?
    errors.add(:cpf) unless CPF.valid?(cpf, strict: true)
  end

  def phone_formatter
    self.phone = Phonelib.parse(phone).e164
  end

  def email_formatter
    self.email.downcase!
  end

  def cpf_formatter
    self.cpf = CPF.new(cpf).formatted
  end
end
