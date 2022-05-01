# アプリケーション名
RakurakuDinner

# アプリケーション概要
手軽な料理をシェアし、自分の料理のレパートリーを増やしたり確認したりできる。

# URL
https://rakurakudinner-n.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード：admin

・Basic認証ID：2222

・メールアドレス：abcd.@html.com

・パスワード：111aaa

# 利用方法
## レシピ投稿
1.トップページ(一覧ページ）のヘッダーから新規登録を行う。

2.ヘッダー画像右下のプラスボタンから投稿ボタンに遷移する。

3.投稿画面の料理写真をファイル選択からアップロードし、カテゴリ、目安時間、分量をプルダウンから選択する。タイトル、材料、作り方、時短・味付けポイント、応用編（任意）を記載してレシピ投稿ボタンを押す。

## レシピ詳細
1.トップページ（一覧ページ）のレシピの写真をクリックすると、投稿した具体的内容を見ることができる。

## レシピ編集
1.ログインユーザーと投稿したユーザーが同じであれば、レシピ詳細ページに編集ボタンがあり、クリックする。

2.画像以外の投稿したものがそのまま表示されるので、内容を変更してレシピ変更ボタンを押す。

## レシピ削除
1.ログインユーザーと投稿したユーザーが同じであれば、レシピ詳細ページに削除ボタンがあり、クリックする。

## レシピ検索
1.トップページ（一覧）のヘッダーからレシピ検索ボタンに遷移する

2.レシピ名、カテゴリ、材料の各項目に入力することで、複数の条件から検索ができる。

3.検索にヒットしたものは写真をクリックすることで詳細画面に遷移する

# アプリケーションを作成した背景
自分が料理アプリを使う際、調べただけで作らずに終わってしまい、決まりきったものを作っていることに気がついた。

課題を分析したところ、調理時間の明記がないこと、自分の料理のレパートリーを整理できていないことが原因であるとわかった。

これらの問題を解決するために、「仕事終わりでも手軽に作れる」をテーマにレシピ投稿・検索アプリを開発することにした。

# 洗い出した要件
要件を定義したシート

https://docs.google.com/spreadsheets/d/1xe1YFL8i_pGJoLgtkkDis8fGznSYab1SJrrqA67DQu8/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
料理投稿サイト

緑色のプラスボタンから新規投稿できる。

トップページではレシピ一覧の写真、タイトル、目安時間をみることができる。
[![Image from Gyazo](https://i.gyazo.com/f2d855c1c08b920c11bf6ef6629a4397.png)](https://gyazo.com/f2d855c1c08b920c11bf6ef6629a4397)

# 実装予定の機能
画像のプレビュー機能、いいね機能、ユーザーのプロフィール画面作成

# データーベース設計
[![Image from Gyazo](https://i.gyazo.com/e7b980e5c2debcf334da9369c966dacc.png)](https://gyazo.com/e7b980e5c2debcf334da9369c966dacc)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a3415d70fb267ffc0cfc6012e8d8f950.png)](https://gyazo.com/a3415d70fb267ffc0cfc6012e8d8f950)

# 開発環境
・フロントエンド
・バックエンド
・テスト
・テキストエディタ

# 工夫したポイント
複数の条件からレシピを検索できるように、ransackを使い検索機能を実装した。
統一感があり、食欲が湧くような見た目を目指した。


# テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| cooking_history_id | text       | null: false                    |
| introduction       | text       | null: false                    |

### Association
-has_many :recipes

## recipesテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| title              | string     | null: false                    |
| cooking_time_id    | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| quantity-id        | integer    | null: false                    |
| ingredients        | text       | null: false                    |
| process            | text       | null: false                    |
| point              | text       | null: false                    |
| extra              | text       |                                |
| user               | references | null: false, foreign_key: true |

## Association
-belongs_to :user



