class User < ApplicationRecord
  validates :name, :email, :cpf, :phone, presence: true
  validates :name, length: { minimum: 2 }
  validates :cpf, uniqueness: true

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :validate_cpf_format

  private

  def validate_cpf_format
    errors.add(:cpf, 'is not a valid CPF') unless CPF.valid?(cpf)
  end
end
