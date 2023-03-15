require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.create(
        first_name:            "Test",
        last_name:             "User",
        email:                 "test@test.com",
        password:              "secret",
        password_confirmation: "secret"
      )
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without a last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid with a duplicate email' do
      user2 = User.create(
        first_name:            "Test",
        last_name:             "User",
        email:                 "TEST@test.com",
        password:              "secret",
        password_confirmation: "secret"
      )
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid with a password shorter than 6 characters' do
      @user.password = 'short'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'is not valid when password and password_confirmation do not match' do
      @user.password_confirmation = 'notsecret'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(
        first_name:            "Test",
        last_name:             "User",
        email:                 "test@test.com",
        password:              "secret",
        password_confirmation: "secret"
      )
    end

    it 'returns user when credentials match' do
      user = User.authenticate_with_credentials('test@test.com', 'secret')
      expect(user).to eq(@user)
    end

    it 'returns nil when email is incorrect' do
      user = User.authenticate_with_credentials('wrongemail@test.com', 'secret')
      expect(user).to be_nil
    end

    it 'returns nil when password is incorrect' do
      user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
      expect(user).to be_nil
    end

    it 'authenticates with email with leading/trailing spaces' do
      user = User.authenticate_with_credentials('  test@test.com  ', 'secret')
      expect(user).to eq(@user)
