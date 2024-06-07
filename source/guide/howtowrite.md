# 作成方法

## DevContainerによる環境の起動

vscodeのDevContainer機能(`Ctrl-Shift-P` -> `HOGEHOGE`)を使い、PHP開発環境にて起動してください。
この環境にて、以下のサービスが起動します。

* PHP入りWebサーバー
* データベースサーバー(MySQL)
* phpMyAdmin(データベース用GUI)

まず、HTMLおよびPHPファイルを作成して、表示可能かをテストしていきましょう。

## HTMLなど公開コードでテストする

`public`ディレクトリ以下に書いてください。
以下のファイルがインデックスとして参照されます。
参照の順番があるので注意してください(先に見つけた方が優先されます)。

1. `index.html` ※ `htm`は非推奨
2. `index.php`

ここでは、`public/index.php` を書いたとします。


```{literalinclude}  src/index.php
:language: php
:caption: src/index.php
```

作成後、「ポート」ビューにて80番の転送行を使ってブラウザを呼び出してください。

```{image} images/view-port.png
:alt: ポートビュー(ただの80の行を使用する)
:width: 80%
:align: center
```

これで表示されていればOKです。

```{image} images/index-result.png
:alt: テストページの出力(ブラウザ)
:width: 80%
:align: center
```

ということで、`public` ディレクトリ以下に配置したファイルは、そのままブラウザ上でアクセス可能です。

