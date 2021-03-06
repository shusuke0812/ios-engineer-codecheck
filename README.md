# 株式会社ゆめみ iOS エンジニアコードチェック課題

<details>
<summary><b>Duplicate先の原文はこちら</b></summary>
<div>


## 概要

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に iOS エンジニアを希望する方に出す課題のベースプロジェクトです。本課題が与えられた方は、下記の概要を詳しく読んだ上で課題を取り組んでください。

## アプリ仕様

本アプリは GitHub のリポジトリーを検索するアプリです。

![動作イメージ](README_Images/app.gif)

### 環境

- IDE：基本最新の安定版（本概要作成時点では Xcode 11.4.1）
- Swift：基本最新の安定版（本概要作成時点では Swift 5.1）
- 開発ターゲット：基本最新の安定版（本概要作成時点では iOS 13.4）
- サードパーティーライブラリーの利用：オープンソースのものに限り制限しない

### 動作

1. 何かしらのキーワードを入力
2. GitHub API（`search/repositories`）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
3. 特定の結果を選択したら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示

## 課題取り組み方法

Issues を確認した上、本プロジェクトを [**Duplicate** してください](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)（Fork しないようにしてください。必要ならプライベートリポジトリーにしても大丈夫です）。今後のコミットは全てご自身のリポジトリーで行ってください。

コードチェックの課題 Issue は全て [`課題`](https://github.com/yumemi/ios-engineer-codecheck/milestone/1) Milestone がついており、難易度に応じて Label が [`初級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A初級+milestone%3A課題)、[`中級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A中級+milestone%3A課題+) と [`ボーナス`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3Aボーナス+milestone%3A課題+) に分けられています。課題の必須／選択は下記の表とします：

|   | 初級 | 中級 | ボーナス
|--:|:--:|:--:|:--:|
| 新卒／未経験者 | 必須 | 選択 | 選択 |
| 中途／経験者 | 必須 | 必須 | 選択 |

課題が完成したら、リポジトリーのアドレスを教えてください。

</div>
</details>
<br />

---
#### ※ 下記はDuplicate先の原文に追記したもの

## 課題取り組み内容
### 開発環境
- Xcode version 12.0
- pod version 1.9.3
- 開発ターゲット iOS 14.0

### セットアップ
#### バージョン管理
1. `git flow` コマンドをインストール
``` bash
$ brew install git-flow
```

#### プロジェクトファイル
1. branchを確認して master になっていたら開発用の develop に切り替える
``` bash
$ git branch
$ git checkout develop
```
2. Cocoapodsにてライブラリをインストールする
``` ruby
$ pod install
```
3. Xcodeでプロジェクトファイルを開く
``` bash
$ open iOSEngineerCodeCheck.xcworkspace
```

### バージョン管理
- [GitFlow](https://danielkummer.github.io/git-flow-cheatsheet/index.ja_JP.html) を採用
- 開発者２人以上になることを想定して `git flow init` コマンドにてGitFlowのbranchを作成
- ただし、現在は開発者１人でのコード修正なので feature branch を切らずに develop を直接修正
- feature branch を切る場合は次のステップでローカル開発を行う
  - `git flow feature start {branch name A}` で branch を作成し編集する
  - `git flow feature finish {branch name A}` で作業を終了すると develop にマージされる
  - なお、feature branch は必要に応じて push する

### 設計の考え方
- １画面 = 1 ViewController + 1 Stroyboard を基本構成としてディレクトリ構造を整理
- MVVMアーキテクチャを使用
  - 各ファイルの基本的な役割は、
    - BaseView.swift： 画面表示
    - ViewController.swift： 画面遷移、インタラクション表示、BaseViewとViewModelの接続
    - ViewModel： View表示に必要な値の保持、セルの更新
    - Repository（Model）： サーバーへのリクエスト処理
  - ファイルの命名規則は、
    - BaseView： 画面内容+BaseView.swift、
    - ViewController: 画面内容+ViewController.swift、画面内容+ViewController.storyboard
    - ViewModel: 画面内容+ViewModel.swift
    - Repository（Model）: 画面内容+Repository.swift
- クラス内でのみ使用するメンバ、メソッドを明示するために `self` キーワード及び `private` キーワードを使用
- 各ファイルで使用するメソッドは、役割毎に `extension` を使用して分けることで可読性、メンテナンス性の向上を図った
- 静的解析ツールはswiftlintを使用した（詳細なルールは[.swift.yml](https://github.com/shusuke0812/ios-engineer-codecheck/blob/develop/.swiftlint.yml)を参照）
- UIImage, Storyboard, ViewController, Nib, DequeueReusableCellの生成はハードコードを防ぐためにR.Swiftを使用
- [補足](https://docs.google.com/document/d/17Yw5mwveyvS5llqP7CnE-C9KhJ9JP55ZnwIiUUik4yE/edit?usp=sharing)

### 機能変化点
- 【無効】インクリメンタルサーチができるようにした
  - ただし、導入目的は `searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)` メソッドの使い方を勉強するためである。GitHubリポジトリの検索アプリの仕様としては不要かもしれない
- ページネーションできるようにした

### UI変化点
- 画面のタイトルを変更
- BaseViewで画面表示を管理するために、TableViewをView配下に設置
- リポジトリの検索結果が空の場合、「リポジトリがないよー」というメッセージを表示するようにした
- リポジトリ検索中にHUDを表示するようにした
- リポジトリの読み込み失敗時に「読み込みに失敗しました」というアラートを表示するようにした
- セル、詳細画面を下記の写真のように変更

| 検索前 | 検索後 | 詳細画面 |
|:-----:|:-----:|:-----:|
|![検索前](README_Images/search_screen.png)|![検索後](README_Images/search_result_screen.png)|![詳細画面](README_Images/search_result_detail_screen.png)|

| iPad |
|:----:|
|![iPad](README_Images/iPad_screen.png)|

### 今後の取り組み内容
- [本リポジトリのProject](https://github.com/shusuke0812/ios-engineer-codecheck/projects/1) にあるToDo及びDoingを予定

### 参考
- [GitHub API ドキュメント](https://docs.github.com/ja/rest/reference/search#search-repositories)

### メモ
- Xcodeの環境変数確認例
```bash
$ xcodebuild -showBuildSettings | grep "PROJECT"
```
- イシュー内容の枠組み
- （下記に基づき、テキスト・画像・gifなどを用いて説明する）
  - バグ、新機能の詳細は？
  - テスト実施環境は？
    - iPhoneデバイスの種類（8, 11proなど）
    - iOSバージョン
  - 期待する挙動は？
  - バグ再現手順、新機能確認手順は？