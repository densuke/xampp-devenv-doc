# 開発コンテナーが起動できない

## 問題

開発コンテナーの起動ができない。
コマンドパレットにて{menuselection}`Rebuild and Reopen in Containers`を選択しても、環境が選べず起動できない。

1. コマンドパレットにて開発コンテナーでの起動を指示しても
    ```{image} images/cp-reopen-in-container.png
    :alt: コマンドパレットでRebuild and Reopen in container
    :width: 50%
    :align: center
    ```
2. 環境の確認が表示されず、どこに環境を作るかの確認が出てしまう
    ```{image} images/where-make-config.png
    :alt: 環境名の確認が出ないで、どこにつくるかが出てしまう
    :width: 50%
    :align: center
    ```

## 原因

開発コンテナーは、開いているディレクトリ直下に `.devcontainer` ディレクトリが存在するときのみ機能する。
ところが、授業(科目)のフォルダー置場直下を開いてしまっている場合には、そのフォルダー直下に `.devcontainer` ディレクトリが存在していない状況となる。
このため、設定が検出できず、設定を作成するための確認(作成場所の確認)が出てしまう。

たとえば、下図のように科目のフォルダー置場を開くような状況を想定してみる。

```{image} images/explorer-open-webappdev.png
:alt: Webアプリケーション開発用フォルダーを直接開いてしまった場合
:width: 40%
:align: center
```

この場合、`.devcontainer` ディレクトリが直下にない(`02-html-css-densuke/.devcontainer`等で存在する)ため、環境が読み出せない状況となる。


## 対策

**現在行っている項目のフォルダーのみを開いた状態**にすればよい。
例えば`11-db-crud-XXXXXXXX`(末尾はユーザー名)フォルダーを利用するのであれば、このフォルダーのみを開けばよい。

1. {menuselection}`ファイル-->フォルダーを開く`を選択する
2. 対象ディレクトリ(今回の例であれば `11-db-crud-XXXXXXXX`)を選択する
    ```{image} images/open-section-dir.png
    :alt: 該当フォルダーを開いた状態(`.devcontainer`が直下に出ている)
    :width: 40%
    :align: center
    ```

この状態で、コマンドパレットから{menuselection}`Rebuild and Reopen in Containers`を選択すれば、開発コンテナーが起動する。

```{image} images/select-devcontainer.png
:alt: 開発コンテナーの選択画面
:width: 75%
:align: center
```

## 補足事項

各フォルダーを個別に開かないため、長く使うとどのフォルダーを最近使っていたかなどがわからなくなることがある。
こういうときは {menuselection}`最近開いた項目(Open Recents)...` を使えばよい。

```{image} images/open-recents.png
:alt: 「最近開いた項目」の選択画面
:width: 60%
:align: center
```

この画面では、検索フィルタが機能しているため、一部の文字を入れることで絞り込みも可能となっている。
