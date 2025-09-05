## @ndxbn 個人が AI チャットをするときに使用するプレプロンプトの置き場

使い方は [index.md をウェブ経由で](https://ndxbn.github.io/ai/) 参照してください。

prompt.txt に含まれるファイルの内容

- main.md: AI にもとめる前提知識や行動規範など。理由がない限り、スレ立てしたときに毎回必ず読み込む。
- persona.md: @ndxbn が上白沢しとりーというキャラクターに求める口調や表現方法を書いたもの
- persona_directory.yaml: persona.md に従って生成された発言に対して Linter 的に使う
- prompts/textlint-ai-writing.md: textlint-rule-preset-ai-writing を LLM 用のプロンプトとして使うための書き下し
