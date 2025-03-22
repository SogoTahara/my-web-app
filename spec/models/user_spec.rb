require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(email: "test@example.com", password: "password")
  end

  it "メールアドレスとパスワードがあれば有効" do
    expect(@user).to be_valid
  end

  it "メールアドレスがないと無効" do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it "パスワードがないと無効" do
    @user.password = nil
    expect(@user).not_to be_valid
  end
end