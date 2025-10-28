## 用語とか概要など

- アジャイル開発（[What is Agile?](https://www.atlassian.com/agile)）
- ISO 9000 シリーズ
- PMBOK

## 各種ダイアグラム
### タスクの種類と構造

```mermaid
classDiagram
    direction TD

    class WorkItem {
        <<abstract>>
        +Type
        +DoR /* Ready の定義、開始条件 */
        +DoD /* Doing の定義、完了条件 */
    }
    class Epic {
        Type: "Epic"
    }
    class UserStory {
        Type: "UserStory"
    }
    WorkItem <|-- Epic
    WorkItem <|-- UserStory

    class Activity {
        <<abstract>>
        +Type
        +DoD /* Doing の定義、完了条件 */
    }
    class Task {
        Type: "Task"
    }
    class Spike {
        Type: "Spike"
    }
    class Learning {
        Type: "Learning"
    }
    Activity <|-- Task
    Activity <|-- Spike
    Activity <|-- Learning

    class Issue {
        <<instance>>
    }
    Issue ..> WorkItem : "is an instance of"
    Issue ..> Activity : "is an instance of"
```

- いわゆる「タスク」は、粒度の大きい順に Epic、UserStory、Task になる。
- Epic や UserStory にて DoR が明確になっていない場合に、それを明確にするためのタスクが Spike。
- 「Learning（勉強）」は、時間制限を設けないない、つまり工数やサイズの見積もり不要。

### Issue の状態遷移図

```mermaid
stateDiagram-v2
    [*] --> Backlog
    Backlog --> Ready : DoR Gate (Pass)
    Ready --> Doing : WIP Limit Gate (Pass)
    Doing --> Done : DoD Gate (Pass)
    
    Doing --> Ready : Paused / Blocked
    Ready --> Backlog : Reprioritized
```
