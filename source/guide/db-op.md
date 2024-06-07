# データベースの構成変更について

用意されているデータベースについて、以下の操作をする場合に参照してください。

* データベース名・アクセス情報を変えたい
* テーブルを初期状態で準備したい

(dbconfig)=
## データベース名・アクセス情報の変更

```{warning}
以下の操作を行うと、データベース中に含まれる全データが消去されます。
残したいデータがある場合は、テーブル構造や値のエクスポートを行ってください。
```

`env.txt` の内容を変更することで、データベースに関する設定を変更可能です。
なお、データベースサーバー名 "db" は本環境では固定です。

```{literalinclude} src/env.txt
:caption: env.txt
```

内容を変更後、変更を反映させるためには、以下の手順で操作をしてください。

1. 開発環境(DevContainer)からローカルの環境に一度戻る
    1. コマンドパレットを開く
    2. `Dev Containers: Reopen Folder Locally`を呼び出す
    3. ウィンドウ左下の表示から「開発コンテナー」の文字が消えた形になるまで少し待つ
       ```{image} images/in-devcontainer.png
       :caption: 60%
       :align: center
       ```
       ```{image} images/out-devcontainer.png
       :caption: 40%
       :align: center
       ```
2. 一度DevContainerとボリューム(データベースのデータエリア)を削除する
    1. ターミナルを開く
    2. プロンプトにて、以下のコマンドを入力します(コピー&ペーストOK)
        ```{code-block}
        :language: powershell

        PS> docker compose down --remove-orphans -v
        ```
3. 再度DevContainerを開く
    1. コマンドパレットを開く
    2. `Dev Containers: Rebuild and Reopen in Container`
    3. "PHP開発環境" を選択

以上で`env.txt`での設定に更新されます。
アプリケーション内で使っている設定も更新しておきましょう。

(dbexport)=
## データベース構造のエクスポート

データベース構造のエクスポートを行うには、pnpMyAdminページでの {menuselection}`エクスポート` を使って下さい。

```{note}
{menuselection}`エクスポート` を選択する場所に注意してください

* データベース名をクリックしてからのエクスポートは「データベース全体」が対象
* テーブル名をクリックしてからのエクスポートは「テーブル」が対象
```

```{image} images/db-export.png
:alt: phpMyAdmin: エクスポート設定
:width: 80%
:align: center
```

下部にある{menuselection}`エクスポート`ボタンを押すとデータベース内の情報をSQLの形でエクスポートしてダウンロードできます。

必要なら適宜書き換えて使えますが、書き換え時にエラーが混入しているとインポート時にエラーが発生するので注意してください。

エクスポートしたファイルは[このようなSQLファイル](#SAMPLE.sql)になっています。

## データベース構造のインポート

データベース構造をインポートするためには2つの方法があります。

* phpMyAdminを使ってインポートする
* データベース構造をリセットする

### phpMyAdminを使ったインポート

起動後の環境にてインポートする方法です。
エクスポートの時と同じように {menuselection}`インポート` へ進んでください。

```{image} images/import-phpmyadmin.png
:alt: phpMyAdmin:インポート設定
:width: 80%
:align: center
```

ここでファイルとしてダウンロード(エクスポート)しておいたSQLのファイルをアップロードすることで書かれた内容(SQL文)を評価して再度設定します。

```{image} images/import-result-phpmyadmin.png
:alt: phpMyAdmin:インポート結果
:width: 80%
:align: center
```

```{warning}
データベース内にテーブルが残っていると、既存のテーブルと競合してエラーになることがあります。
完全にテーブルを削除するか、「もしテーブルがあれば削除」のコード(SQL)を入れておく必要があります。
```


### データベースのリセット時の初期化に使う方法

[データベースの構成変更](#dbconfig)の際に、SQLファイルを読み込ませることができます。
手順として、**手順2**まで進めた後で、dbディレクトリに読み込ませたいSQLファイルを配置してください。

```{image} images/db-preconfig.png
:alt: dbディレクトリ中にSQLファイルを配置
:width: 50%
:align: center
```

この状態で **手順3**(DevContainerの起動)を行うと、配置したSQLファイルを初期化時に読み込んで構成します。
