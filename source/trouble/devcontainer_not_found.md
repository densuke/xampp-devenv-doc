# 開発コンテナーが起動できない

## 問題

開発コンテナーの起動ができない。
コマンドパレットにて{menuselection}`Rebuild and Reopen in Containers`を選択しても、何も起きない。

```{image} images/cp-reopen-in-container.png
:alt: コマンドパレットでRebuild and Reopen in container
:width: 50%
:align: center
```

環境の確認が表示されず、どこに環境を作るかの確認が出てしまう。

```{image} images/where-make-config.png
:alt: 環境名の確認が出ないで、どこにつくるかが出てしまう
:width: 50%
:align: center
```

## 原因

開発コンテナーは、開いているディレクトリ直下に `.devcontainer` ディレクトリが存在するときのみ機能する。
ところが、授業(科目)のフォルダー置場直下を開いてしまっている場合には、そのフォルダー直下に `.devcontainer` ディレクトリが存在していない状況となる。
このため、設定が検出できず、設定を作成するための確認(作成場所の確認)が出てしまう。

たとえば、下図のように、科目のフォルダー置場を開くような状況(下図では「Webアプリケーション開発」向けに指示された場所を開いている)であれば、環境が読み出せない状況となる。

```{image} images/explorer-open-webappdev.png
:alt: Webアプリケーション開発用フォルダーを直接開いてしまった場合
:width: 40%
:align: center
```

## 対策

現在行っている項目のフォルダーのみを開いた状態にすればよい。
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
