class User < ApplicationRecord
  before_validation :strip_blanks
  before_validation :email_formatter
  before_validation :phone_formatter
  before_validation :cpf_formatter

  validates :name, :email, :phone, :cpf, presence: true
  validates :name, length: { minimum: 2 }, format: { with: /\A[A-Za-zÀ-ÖØ-öø-ÿ. -]+\z/ }
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }, uniqueness: true
  validates :phone, format: { with: /\A(\(?\d{2}\)?\s?)(\d{4,5}\-?\d{4})\z/ }

  validates :cpf, uniqueness: true

  validate :valid_cpf?

  private

  def strip_blanks
    self.name = self.name.strip
    self.email = self.email.strip
    self.cpf = self.cpf.strip
    self.phone = self.phone.strip
  end

  def valid_cpf?
    errors.add(:cpf) unless CPF.valid?(cpf, strict: true)
  end

  def cpf_formatter
    self.cpf = CPF.new(cpf).formatted
  end

  def email_formatter
    self.email.downcase!
  end

  def phone_formatter
    phone_unformated = phone.gsub(/[^0-9,.]/, "")
    if phone_unformated.length == 11
      self.phone = format_cel_phone(phone_unformated)
    elsif phone_unformated.length == 10
      self.phone = format_landline_phone(phone_unformated)
    end
  end

  def format_cel_phone(phone)
    "(#{phone[0..1]}) #{phone[2..6]}-#{phone[7..10]}"
  end

  def format_landline_phone(phone)
    "(#{phone[0..1]}) #{phone[2..5]}-#{phone[6..9]}"
  end

end
