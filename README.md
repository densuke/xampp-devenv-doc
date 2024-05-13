# これはなに?

授業用XAMPPもどき環境(DB付き)のマニュアルです。
Sphinxを用いたHTML組版をほどほどにしてくれます。

# 使い方

ローカルで使う場合、Python3とpipenvおよびGNU makeが必要です。

```bash
$ pip install pipenv
```

※ 環境によっては `pip3` で実行する必要があるかもしれません。

その後、Sphinxで組版を行ってください。

```bash
$ make html
```

生成物は `build/html/index.html` にて確認できるので、ブラウザで開いてみてください。

## おまけ: Webサーバー(内蔵)経由で見る

```bash
$ make html-auto
```

にて内蔵Webサーバーが動くので、 http://127.0.0.1:8000/ で閲覧できます。

