require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'valid user should be valid' do
    assert @user.valid?
  end

  # NAME
  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should have a minimum length of 2' do
    @user.name = 'A'
    assert_not @user.valid?
  end
  # CPF
  test 'cpf should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'cpf should be present' do
    @user.cpf = ''
    assert_not @user.valid?
  end

  # E-MAIL
  test 'email should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should have a valid format' do
    invalid_emails = ['invalid', 'invalid@', 'invalid.com']
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end

  # PHONE
  test 'phone should have a valid format' do
    invalid_phones = ['1234-567', '1234-56789', '123-456-7890', '21 99518 0000']
    invalid_phones.each do |phone|
      @user.phone = phone
      assert_not @user.valid?
    end
  end
  # MODEL METHODS

  # valid_cpf?
  test 'valid_cpf? should add an error for an invalid CPF' do
    @user.cpf = '12345678900' # An invalid CPF
    assert_not @user.valid?
    assert_includes @user.errors[:cpf], 'is invalid'
  end

  # email_formatter
  test 'email_formatter should downcase email' do
    email = 'Test@Example.com'
    @user.email = email
    @user.save
    assert_equal @user.email, email.downcase
  end

  # cpf_formatter
  test 'cpf_formatter should format the CPF' do
    cpf = '622.515.905-36'
    @user.cpf = '62251590536'
    @user.save
    assert_equal @user.cpf, cpf
  end
  # phone_formatter
  test 'phone_formatter should format cel phone number in format (11) 12345-6789' do
    phone = '(11) 12345-6789'
    @user.phone = '(11) 12345-6789'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format cel phone number in format 11 12345-6789' do
    phone = '(11) 12345-6789'
    @user.phone = '11 12345-6789'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format cel phone number in format 11 123456789' do
    phone = '(11) 12345-6789'
    @user.phone = '11 123456789'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format cel phone number in format 11123456789' do
    phone = '(11) 12345-6789'
    @user.phone = '11123456789'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format landline phone number in format (11) 1234-5678' do
    phone = '(11) 12345-6789'
    @user.phone = '11123456789'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format phone number in format 11 1234-5678' do
    phone = '(11) 1234-5678'
    @user.phone = '11 1234-5678'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format phone number in format 11 12345678' do
    phone = '(11) 1234-5678'
    @user.phone = '11 12345678'
    @user.save
    assert_equal @user.phone, phone
  end

  test 'phone_formatter should format phone number in format 1112345678' do
    phone = '(11) 1234-5678'
    @user.phone = '1112345678'
    @user.save
    assert_equal @user.phone, phone
  end

end
