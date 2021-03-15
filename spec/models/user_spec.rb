require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる場合' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '999999'
        @user.password_confirmation = '999999'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない場合' do
      it 'nicknameが空では登録できない' do
        user = FactoryBot.build(:user)  # Userのインスタンス生成
        user.nickname = '' # nicknameの値を空にする
        user.valid?
        expect(user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        user = FactoryBot.build(:user) # Userのインスタンス生成
        user.email = '' # emailの値を空にする
        user.valid?
        expect(user.errors.full_messages).to include 'メールアドレスを入力してください'
      end
      it 'パスワードが空では登録できない' do
        user = FactoryBot.build(:user) # Userのインスタンス生成
        user.password = ''  # emailの値を空にする
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
    end
  end
end
