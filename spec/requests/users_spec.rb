require 'rails_helper'

RSpec.describe "ユーザー登録", type: :request do
  it "新規登録できる" do
    post user_registration_path, params: { 
      user: { email: "newuser@example.com", password: "password", password_confirmation: "password" } 
    }
    expect(response).to have_http_status(:see_other) # リダイレクトされる
    follow_redirect!
    expect(response.body).to include("ログアウト") # ログイン状態を確認
  end
end