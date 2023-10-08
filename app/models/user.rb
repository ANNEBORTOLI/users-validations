class User < ApplicationRecord
  validates :name, :email, :cpf, :phone, presence: true
  validates :name, length: { minimum: 2 }
  validates :cpf, uniqueness: true

  validates :email, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }

  validate :validate_cpf_format

  private

  def validate_cpf_format
    errors.add(:cpf, 'is not a valid CPF') unless CPF.valid?(cpf, strict: true)
  end
end
