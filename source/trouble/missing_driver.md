# `could not find driver` と出力されてしまう

## 問題

授業内で提示されたサンプルコード([例](https://2024web1.github.io/web_app_dev/db-crud/#select%E6%96%87))を使用した際に、以下のエラーメッセージが出力される。なお日本語テキスト(「接続に失敗しました」)は状況によるため、メッセージの本体である `could not find driver` に注目する。

```text
接続に失敗しました: could not find driver
```

```{image} images/missing-driver.png
:alt: ドライバーが見つからないというメッセージ
:width: 40%
:align: center
```

## 原因

なんらかの理由で「古いpdo_mysqlドライバの入っていないイメージ」で開発コンテナーが起動している状態となっていることが原因。
よって、最新のDockerイメージに差し替えればよい。

この症状は、以前の授業で[densukest/xampp-devenv:alpine](https://hub.docker.com/layers/densukest/xampp-devenv/alpine/images/sha256-2f5c7036ca15793823e36f8182de8e0b0460f3130960bfe1647c110e83c0b082?context=explore)をロードしたことのある環境であれば発生しうる状況になっている。

## 対応

このエラーが発生した場合、最新の`densukest/xampp-devenv:alpine`イメージに更新をかけることで解決する。

<!-- textlint-disable ja-technical-writing/no-unmatched-pair -->

1. 開発コンテナーに入っている場合、いったん開発コンテナーを終了してローカルに戻る({menuselection}`Ctrl-Shift-P--R
eopen Folder Locally`)
2. ターミナルを開く
3. 以下のコマンドを実行して、最新のイメージを取得する
    ```PowerShell
    PS> docker image pull densukest/xampp-devenv:alpine
    ```

4. 再度開発コンテナーを起動する、キャッシュを用いない形で再構築させる({menuselection}`Rebuild Container Without Cache`)こと
    ```{image} images/rebuild-wo-cache.png
    :alt: Rebuild Container Without Cache
    :width: 60%
    :align: center
    ```

5. 問題が解消されていることを確認する(ページを開いて`dbselect.php`を実行する等)

<!-- textlint-enable ja-technical-writing/no-unmatched-pair -->


## 補足事項

本メッセージは、下記のPHPコードにより発生する、そのためエラーメッセージの出力コード(`try`〜`catch`での例外捕捉)を行っていないコードではメッセージが出力されないことに留意してください。

```php
try {
    // PDOを用いてデータベースに接続する
    $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    // 接続できなかった場合のエラーメッセージ
    exit('データベースに接続できませんでした：' . $e->getMessage());
}
```
