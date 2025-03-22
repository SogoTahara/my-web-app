require 'rails_helper'

RSpec.describe "ログイン", type: :request do
  let(:user) { User.create(email: "test@example.com", password: "password") }

  it "正しい情報でログインできる" do
    post user_session_path, params: { 
      user: { email: user.email, password: "password" } 
    }
    expect(response).to have_http_status(:see_other) # リダイレクトされる
    follow_redirect!
    expect(response.body).to include("ログアウト")
  end

  it "誤った情報ではログインできない" do
    post user_session_path, params: { 
      user: { email: user.email, password: "wrongpassword" } 
    }
    expect(response).to have_http_status(:unprocessable_entity) # ステータスコード 422
  end
end