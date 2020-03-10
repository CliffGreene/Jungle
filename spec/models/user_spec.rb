require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:all) do
      @existingUser = User.create(:email => 'hello@example.com', :password => 'password', :password_confirmation => 'password')
    end

    it 'should contain name,email and matching password and password confirmation' do
      
      @user = User.create(name: "test", email: "test@example.com", password: "testtest", password_confirmation: "testtest")
     
      expect(@user).to be_valid
    end

    it 'should have matching password and password confirmation' do
      
      @user = User.create(name: "test", email: "test@example.com", password: "testtest", password_confirmation: "doesn't match password")
     
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'should contain name,email and matching password and password confirmation' do
      
      @user = User.create(name: "test", email: 'hello@example.com', password: "testtest", password_confirmation: "testtest")
     
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end

    it 'should contain name,email and matching password and password confirmation' do
      
      @user = User.create(name: "test", email: 'test@example.com', password: "test", password_confirmation: "test")
     
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end

  end

describe '.authenticate_with_credentials' do
    before(:all) do
      @user = User.create(:email => 'Testy@teSt.com', :password => 'password', :password_confirmation => 'password')
    end

    describe 'correct email and password' do
      it 'should return the user object' do
        @session = @user.authenticate_with_credentials('testy@test.com', 'password')

        expect(@session).to eql(@user)
      end
    end

    describe 'incorrect email and password' do
      it 'should return nil' do
        @session = @user.authenticate_with_credentials('testy@test.com', 'not the password')

        expect(@session).to be_nil
      end
    end

    describe 'correct email and password but case insensitive email' do
      it 'should return the user object' do
        @session = @user.authenticate_with_credentials('testy@test.COM', 'password')

        expect(@session).to eql(@user)
      end
    end

    describe 'correct email and password but white space around email' do
      it 'should return the user object' do
        @session = @user.authenticate_with_credentials('  testy@test.com  ', 'password')

        expect(@session).to eql(@user)
      end
    end

    after(:all) do
      User.delete(@user.id)
    end

  end



end
# validates :password, presence: true
# validates :passwordconfirmation, presence: true
# validates :pwdmatchespwdconfirmation, presence: true
# validates :firstname, presence: true
# validates :lastname, presence: true
# validates :email, presence: true
# validates :uniqueemail, presence: true
# validates :pwdminlength, presence: true