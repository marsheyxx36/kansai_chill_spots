require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe 'スポット投稿機能' do 
    context 'スポット投稿できるとき' do
      it '全ての値が入力されていれば登録できる' do
        post = FactoryBot.build(:post)
        expect(@post).to be_valid
      end
    end
    context 'スポット投稿できないとき' do

      it 'スポット名が空では登録できない' do
        @post.name = ''  # nicknameの値を空にする
        @post.valid?
        expect(@post.errors.full_messages).to include "スポット名を入力してください"
      end

      it 'スポットの説明が空では登録できない' do
        @post.description = ''  # nicknameの値を空にする
        @post.valid?
        expect(@post.errors.full_messages).to include "スポットの説明を入力してください"
      end

      it '住所が空では登録できない' do
        @post.address = ''  # nicknameの値を空にする
        @post.valid?
        expect(@post.errors.full_messages).to include "住所を入力してください"
      end

      it '緯度が空では登録できない' do
        @post.latitude = ''  # nicknameの値を空にする
        @post.valid?
        expect(@post.errors.full_messages).to include "住所を入力し、上のマップ検索ボタンでマップの場所を特定してください"
      end

      it '経度が空では登録できない' do
        @post.longitude = ''  # nicknameの値を空にする
        @post.valid?
        expect(@post.errors.full_messages).to include "Longitudeを入力してください"
      end

      it '画像が登録できない' do
        @post.image = nil  # nicknameの値を空にする
        @post.valid?
        expect(@post.errors.full_messages).to include "画像を入力してください"
      end


    end
  end
end
