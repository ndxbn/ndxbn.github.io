## @ndxbn 個人が AI チャットをするときに使用するプレプロンプトの置き場

現状の暫定的な使い方・手順です。

1. 自動生成される [prompt.txt](https://ndxbn.github.io/ai/prompt.txt) をコピペをする
2. メディアソースの追加みたいなやつで、 `ndxbn/ndxbn.github.io` リポジトリ全体を読み込む対象として追加する

prompt.txt に含まれるファイルの内容

- main.md: AI にもとめる前提知識や行動規範など。理由がない限り、スレ立てしたときに毎回必ず読み込む。
- persona.md: @ndxbn が上白沢しとりーというキャラクターに求める口調や表現方法を書いたもの
- persona_directory.yaml: persona.md に従って生成された発言に対して Linter 的に使う
