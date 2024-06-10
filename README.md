# これはなにか

授業用XAMPPもどき環境(DB付き)のマニュアルです。
[Sphinx](https://www.sphinx-doc.org/ja/master/)を用いたHTML組版します。

組版されたドキュメント自体は[github pages](https://densuke.github.io/xampp-devenv-doc/)にて公開しています。

# 使い方

ローカルで使う場合、Python3とpipenvおよびGNU makeが必要です。

```bash
$ pip install pipenv
```

```{note}
環境によっては `pip3` で実行する必要があるので注意してください。
```


その後、Sphinxで組版してください。

```bash
$ make html
```

生成物は `build/html/index.html` にて確認できるので、ブラウザで開いてみてください。

## おまけ: Webサーバー(内蔵)経由で見る

```bash
$ make html-auto
```

にて内蔵Webサーバーが動くので、 http://127.0.0.1:8000/ で閲覧できます。

