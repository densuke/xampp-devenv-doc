# データベース周り
## データベースの操作

データベースは phpMyAdminにて操作可能です。
同じくポートビューにて、 `phpmyadmin:80` の行からアクセス可能です。

```{image} images/phpmyadmin-port-view.png
:alt: phpmyadminへのビュー表示
:width: 80%
:align: center
```

地球アイコンのクリックでphpMyAdminページへ移動できます。

```{image} images/phpmyadmin-top.png
:alt: phpMyAdmin接続直後の画面
:width: 80%
:align: center
```

標準状態でサンプルのデータベース(SAMPLE)が用意されているので、それを使って下さい。
なお本環境では **データベースはひとつだけ作成されます** 。
通常はひとつのデータベースで十分作れるでしょうから、この中でテーブルを作成していきましょう。

```{note}
データベースの設定(名前やアクセス情報)を変更したい場合は、
こちらを参照してください。
```

## データベースの設定について

データベースの設定は、 `env.txt` を参照してください。

```{literalinclude}  src/env.txt
:caption: env.txt
```

見るだけでもわかると思いますが、以下の構造で記述されています。

* `MYSQL_ROOT_PASSWORD`: 万一特権アクセスが必要な場合に利用するパスワード(ほぼ使いません)
* `MYSQL_DATABASE`: 作成するデータベース名
* `MYSQL_USER`: `MYSQL_DATABASE`で作成したデータベースへの(ほぼ)フルアクセス権を持つユーザー名
* `MYSQL_PASSWORD`: `MYSQL_USER`に対するパスワード

````{note}
特権アクセスが不要であれば、`MYSQL_ROOT_PASSWORD`の代わりに
```
MYSQL_RANDOM_ROOT_PASSWORD=1
```
と設定しておいてください。これで管理特権取得することが(すごく)困難となります。
````

このファイルを変更した場合、反映には環境の再構築が必要になります。
この件については、[データベース名・アクセス情報の変更](#dbconfig)を参照してください。

## データベースへのアクセス

PHPの[PDO](https://www.php.net/manual/ja/class.pdo.php)(MySQLドライバ)によるアクセスとしては、以下のようになります。

```{literalinclude} src/list-tables.php
:language: php
:caption: public/test.php
```

これで、`test.php`にブラウザでアクセス(ポートビューでブラウザ表示させた後、アドレスを表示して`/test.php`を付加)すると、以下のように見えます。
初期状態ではテーブルが無いので0件と出ます。

```{image} images/list-tables-0.png
:alt: PHPでのテスト(テーブル無し)
:width: 60%
:align: center
```

phpMyAdmin側でテーブルを適当に足してからアクセスしてみると、件数が増えるので確認できます。

```{image} images/list-tables-1.png
:alt: PHPでのテスト(テーブル追加後)
:width: 60%
:align: center
```

## PHPコードについて

このテキストはPHPの学習参考書ではありませんので、
データベースへの接続や利用については、各自で調べてください。
