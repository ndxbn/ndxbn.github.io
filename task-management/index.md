## 用語とか概要など

- アジャイル開発（[What is Agile?](https://www.atlassian.com/agile)）
- ISO 9000 シリーズ
- PMBOK

## 各種ダイアグラム
### タスクの種類と構造

```mermaid
classDiagram
    direction TD

    class Process {
        <<abstract>>
        +Type
        +DoR
        +DoD
    }
    class Epic {
        Type: "Epic"
    }
    class UserStory {
        Type: "UserStory"
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

    Process <|-- Epic
    Process <|-- UserStory
    Process <|-- Task
    Process <|-- Spike
    Process <|-- Learning

    class Issue {
        +ID
        +Title
        +State (Column)
    }
    Issue ..> Process : "is an instance of"
```

### Issue の状態遷移図

```mermaid
stateDiagram-v2
    [*] --> Backlog
    Backlog --> Ready : DoR Gate (Pass)
    Ready --> Doing : WIP < 1 (Start)
    Doing --> Done : DoD Gate (Pass)
    
    %% 差し戻しや優先度変更
    Doing --> Ready : Paused / Blocked
    Ready --> Backlog : Reprioritized
```
