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
| latitude| float | null: false |
| longitude| float | null: false |
| user_id| reference | foreign_key: true,null: false |

## Commentテーブル

| Column | type | option |
| :--- | :--- | :--- |
| text| string | null: false |
| user_id| reference | foreign_key: true,null: false |
| post_id| reference | foreign_key: true,null: false |