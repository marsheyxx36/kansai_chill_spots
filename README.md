# Kansai_chill_spots

<img width="1438" alt="スクリーンショット 2021-08-25 15 26 17" src="https://user-images.githubusercontent.com/49363628/130737766-602eb670-9ffa-482d-a920-678f82238898.png">



# アプリケーション概要

関西の静かな（チルアウトな）スポットの共有サイトです。

# 機能一覧

・ユーザー登録機能、ログイン機能

・SNSアカウントでの新規登録、ログイン

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
URL：
https://www.kansai-chill-spots.com/

## BASIC認証がかかっています。
ID:admin 、pass:2222　でページにアクセスしてください。

## テスト用アカウント
ログインの際はこちらをお使いください。
メールアドレス：test1@test.com  パスワード：Test123456


## ユーザー新規登録：
トップページより右上の新規登録をクリック　
※ googleアカウント、Facebookアカウントでの登録、ログインも可能です。

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


## Sns_Credentialsテーブル

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
