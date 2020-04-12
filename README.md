# メソッド学習用アプリ

## 仕様
1. 入力フォームに打ち込んで回答ボタンを押すと回答と比較し正誤を判定し結果を表示する
1. 問題はランダムに出現する。
1. 問題文と回答を登録することができる
1. 言語でカテゴリー分けができる
1. 正当率を計算し、低いものの出現率をあげる
1. 問題数を10問単位で指定できるようにする
  1. 問題数に応じて出題する問題の割合の正答率を調整(プラスα)
  1. 正答率も選べるようにする。(プラスα)
  1. 全問出題も選べるようにする
## 設計

1. gonを用いてrubyの変数をjsで使えるようにして、一致、不一致で正誤判定をする。
1. DBからカテゴリーで条件を絞って引っ張ってきてランダムに出現させる。
1. 問題のテーブルを作り、questionカラム、answerカラム、カテゴリーカラムを用意しておく。
1. カテゴリーはactive_hashを使う。
1. 正答率テーブルを用意して正誤判定カラム、問題idを登録できるようにして、正答率を計算してから正当率の低いものを30%刻みで分けてそれを配列に入れて正答率の低い配列から出題するようにする。
  1. 10問(30%以下を全て)、20問(30%以下を6割、60%以下を3割、90%以下を1割)

## DB設計

#### quizテーブル

| カラム名      |       データ型 |    オプション    |
|:-----------------|------------------:|:------------------:|
| question             |        text |        nullfalse        |
| answer           |            text |       nullfalse       |
| category               |      references |         foreginkey         |

##### アソシエーション
belongs_to category
has_many user through: :AccuracyJudgmentHistory

#### userテーブル

| カラム名      |       データ型 |    オプション    |
|:-----------------|------------------:|:------------------:|
| question             |        text |        nullfalse        |
| answer           |            text |       nullfalse       |
| category               |      references |         foreginkey         |

##### アソシエーション
has_many quiz through: :AccuracyJudgmentHistory
#### AccuracyJudgmentHistoryテーブル

| カラム名      |       データ型 |    オプション    |
|:-----------------|------------------:|:------------------:|
| question             |        references |        foreginkey,nullfalse        |
| judge           |            boolean |       nullfalse       |
| user           |            references |       foreginkey,nullfalse       |

##### アソシエーション
belongs_to user
belongs_to quiz

