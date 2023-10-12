class User < ApplicationRecord
  validates :name, length: { minimum: 2 }, presence: true
  validates :cpf, uniqueness: true, presence: true
  validates :email, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }, presence: true
  validates :phone, format: { with: /\A(\(?\d{2}\)?\s?)(\d{4,5}\-?\d{4})\z/ }, presence: true, uniqueness: false
  validate :valid_cpf?
  before_save :email_formatter, :cpf_formatter, :phone_formatter

  private

  def valid_cpf?
    errors.add(:cpf) unless CPF.valid?(cpf, strict: true)
  end

  def email_formatter
    self.email.downcase!
  end

  def cpf_formatter
    self.cpf = CPF.new(cpf).formatted
  end

  def phone_formatter
    phone_unformat = phone.gsub(/[^0-9,.]/, "")
    if phone_unformat.length == 14
      self.phone = format_cel_phone(phone_unformat)
    elsif phone_unformat.length == 13
      self.phone = format_landline_phone(phone_unformat)
    end
  end

  def format_cel_phone(phone)
    "#{phone[0..2]} (#{phone[3..4]}) #{phone[5..9]}-#{phone[10..13]}"
  end

  def format_landline_phone(phone)
    "#{phone[0..2]} (#{phone[3..4]}) #{phone[5..8]}-#{phone[9..12]}"
  end

end
