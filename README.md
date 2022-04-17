#テーブル設計

##usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| cooking_history_id | integer    | null: false                    |
| introduction       | text     | null: false                    |

###Association
-has_many :recipes
-has_many :comments

##recipesテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| title              | string     | null: false                    |
| time_id            | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| quantity-id        | integer    | null: false                    |
| ingredients        | text       | null: false                    |
| process            | text       | null: false                    |
| point              | text       |                                |
| extra              | text       |                                |
| user               | references | null: false, foreign_key: true |

##Association
-belongs_to :user
-has_many :comments

##commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| comment_text       | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| recipe             | references | null: false, foreign_key: true |

###Association
-belongs_to :user
-belongs_to :recipes



