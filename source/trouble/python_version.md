# Pythonのバージョンが原因でテストが通らない場合

この症状はおそらく一時的なものと思われる。
今後の配布リポジトリでは対策済みのものを配布する予定ではある。
とはいえ、しばらく同様の問題が発生する可能性はあり、該当時には以下の対応でやり過ごすこととする。

## 問題

提出したコードのテストが通らない。
ログ(GitHub Actionsによる自動テスト)を見ると、Pythonのバージョン3.11が発見できないという記録が入っている。

```
Warning: Python 3.11 was not found on your system...
```

警告(Warning)扱いとなっているが、検証システムでのPythonが3.12ベースのものとなったために、テストが実行できないという状況となる。

下記の図は、`12-object-XXXXXXX`(ユーザー名)の提出において発生したもの。

```{image} images/autograding-python-version-3.11-missing.png
:alt: テストの際にPythonの3.11が見つからないことによるテスト不良
:width: 80%
:align: center
```

## 原因

利用している環境(サービス名webに対応したイメージ)が更新されて、Pythonのバージョンが3.12ベースに上がっている。
このため、テストの際のPythonの想定バージョンが見つからなくなったものと考えられる。

## 対策(一時的な解決)

利用するPythonのバージョンに対する縛りを「3.11」ではなく「3」とすることで、バージョン3系統の最新版であればテストが動くようになる。

1. 開発コンテナーを一度閉じる({menuselection}`Reopen Folder Locally`)
2. ファイル一覧に `Pipfile` が見えるようになるのでこれを開く
3. 以下の部分を書き替えて保存する(`3.11`の部分を`3`にする)

```{literalinclude} src/Pipfile
:diff: src/Pipfile.old
```

続いて、Pythonの情報を更新するために以下のように操作する。

1. **開発コンテナー** に入る(PHP開発環境)
2. ターミナルを開き、以下のコマンドを入力・実行する(コピー&ペースト推奨)
    ```bash
    $ pip install pipenv --break-system-packages
    $ pipenv update
    ```
3. この結果として**ファイル`Pipenv.lock`が更新される**ため、適当なコミットメッセージにてコミットし、pushにてGitHubへ送信する。

```{image} images/pipenv-update-after.png
:alt: {command}`pipenv update` 後のローカル更新の確認(Git)
:width: 60%
:align: center
```

リポジトリのページをブラウザで開き、 `Actions` の項目で最後のコミットに対するテスト結果を確認する。
上記の対応の結果として、Python 3.12ベースでの利用が行われ、テストが通ることが確認できる。

```{image} images/test-2nd.png
:alt: テストが通ったことを示すログ
:width: 70%
:align: center
```
