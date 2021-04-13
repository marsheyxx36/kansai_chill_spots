# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Kansai_chill_spots


# アプリケーション概要

関西の静かな（チルアウトな）スポットの共有サイトです。

# 機能一覧

・ユーザー登録機能、ログイン機能(SNSアカウントでの新規登録、ログイン)

・スポット投稿機能

・スポットの詳細確認機能

・コメント機能

・ユーザー同士のフォロー機能

・いいね機能

・レスポンシブ対応済です。(スマートフォンでもアクセスOK)
# 作った目的：

静かで落ち着けるスポットの情報は探そうと思っても、なかなかネットでは見つけにくいという課題があります。
人から口コミで聞くことがほとんどです。今回はそういった課題を解決したく、また自分自身も静かなスポットの情報を欲しいと思いこのサイトを作成致しました。


# 利用方法

## BASIC認証がかかっています。
ID:admin 、pass:2222　でページにアクセスしてください。

## テスト用アカウント
ログインの際はこちらをお使いください。
メールアドレス：test1@test.com  パスワード：pass123456


## ユーザー新規登録：
トップページより右上の新規登録をクリック　※ googleアカウント、Facebookアカウントでの登録も可能です。

## スポット投稿機能
トップページのヘッダーより「スポット投稿」を選択→情報を入力し投稿可能です。※全項目入力必須です



## スポット詳細表示、スポット編集・削除　
トップページの投稿されたスポット一覧より各詳細ページに飛び、詳細を確認することができます。投稿した自分のスポットについては詳細ページより編集と削除ができます。


## コメント機能
各スポットの詳細ページの最下部にコメント入力欄があり、コメントの投稿が可能です。

## いいね機能
各スポットの詳細ページではいいねをつけることができます。


## ユーザーページ機能
トップページの投稿一覧で各投稿の投稿者のユーザー名をクリックするとユーザーページに飛び、各ユーザーの情報確認、そのユーザーが投稿したスポット一覧を閲覧することができます。マイページについてはヘッダーのメニューのマイページよりアクセスが可能です。

## フォロー機能
各ユーザーのページでユーザーをフォローすることができます。また各ユーザーのフォロされたユーザー、フォローしたユーザーの一覧を確認できます。


# データーベース設計：

## Userテーブル

| Column | type | option |
| :--- | :--- | :--- |
| name| string | null: false |
| email| string | null: false |
| nickname| string | null: false |

## Postテーブル

| Column | type | option |
| :--- | :--- | :--- |
| name| string | null: false |
| description| string | null: false |
| address| string | null: false |
| image| string | null: false |
| area_id| reference | foreign_key: true,null: false |
| prefecture_id| integer | null: false |
| latitude| float | null: false |
| longitude| float | null: false |
| user_id| reference | foreign_key: true,null: false |

## Commentテーブル

| Column | type | option |
| :--- | :--- | :--- |
| text| string | null: false |
| user_id| reference | foreign_key: true,null: false |
| post_id| reference | foreign_key: true,null: false |

## Areaテーブル

| Column | type | option |
| :--- | :--- | :--- |
| name| string | null: false |
| ancestry |string|

## likeテーブル

| Column | type | option |
| :--- | :--- | :--- |
| user_id| reference | foreign_key: true,null: false |
| post_id| reference | foreign_key: true,null: false |


##　Sns_Credentialsテーブル

| Column | type | option |
| :--- | :--- | :--- |
| provider| string |  |
| uid| string ||
| user_id| reference | foreign_key: true|

## Relationshipテーブル

| Column | type | option |
| :--- | :--- | :--- |
| follower_id| reference | foreign_key: true|
| following_id| reference | foreign_key: true|