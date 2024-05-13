# データベースの利用

開発コンテナー起動完了時点で、既にデータベース(MySQL)が裏で起動しています。
とりあえずDBのコンテナに接続するために、 [phpMyAdmin](https://www.phpmyadmin.net/) も起動しています。
こちらは*ポート*ビューにて確認ができます。

```{note}
ポートビューが見えない場合、`表示→ビューを開く…`にて確認してください。
```

`phpmyadmin:80` の行にて地球アイコンをクリックすることで、ブラウザに切り替わってphpMyAdminによる制御ページに入ることができます。

```{image} images/phpMyAdmin.png
:alt: phpMyAdmin接続直後の画面
:width: 80%
:align: center
```

左側に出ているように、この例では `SAMPLE` というデータベースが初期状態で入っていることがわかります。
