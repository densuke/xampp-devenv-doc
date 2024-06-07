# Docker Desktopのリセット

* Docker Desktopによる更新
* Windows Updateによる更新

以上を行っても正常に起動できない場合は、**Docker Desktopのリセット**を行うことになります。

## 行う前に確認

* これを行うと、マシン上で使っていた開発コンテナやイメージ・その他のコンテナが全て消えます
* ボリュームに入っているデータが消えます
    * データベースのコンテナが持っていたデータ(テーブルや値など)が消えます
    * その他コンテナ内部で使っているボリュームがあればそれも消えます
    * 開発コンテナーに対して手動で行ったカスタマイズも消えます
* ただし、開発コンテナーに入る際に構成情報から復元を行います
    * dbディレクトリに入っている初期化用コード(`init.sql`など)があれば、そこから初期状態の再現は行われます
    * 利用するイメージもなくなっているので、適宜取得/ビルドが行われます
        * その関係で初回起動時は時間がかかります(数分〜十数分)

## リセット方法

1. Docker Desktopのダッシュボードを開きます
2. 右上にある「虫」のマークをクリックします
    ```{image} images/debug-mode.png
    :alt: デバッグモード呼び出し
    :width: 75%
    :align: center
    ```
3. {menuselection}`Reset to factory defaults` をクリックします
    ```{image} images/reset-factory-default-button.png
    :alt: 初期化ボタン
    :width: 80%
    :align: center
    ```
4. 「リセットしていいのか」の確認が出るので、 {menuselection}`Yes, reset anyway` を選んでください
    ```{image} images/reset-confirm.png
    :alt: phpMyAdmin接続直後の画面
    :width: 80%
    :align: center
    ```

以上の作業で初期状態に戻す処理が行われます。数分〜十数分待ちましょう。
リセットが完了すると、ダッシュボードが復帰します。

* ダッシュボード左下のステータスが黄色の **Engine stopping** になる
* その後黄色の **Engine starting** になる
* その後緑色の **Engine running** になる

これで復帰しました。

```{image} images/engine-stopping.png
:alt: Docker Engine: 停止中
:width: 80%
:align: center
```

```{image} images/engine-running.png
:alt: Docker Engine: 起動完了
:width: 80%
:align: center
```

この状態で、イメージもコンテナもボリュームも全くない初期状態に戻りましたので、
開発コンテナーを起動してみてください。環境構築からスタートします。
