# 📜 Quest System

> ℹ️ Try it out!
> Open and run **Quest_Example.tscn** in Godot engine.

## Features
- One-Time Quest ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Reocurrent Quest ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Priority Quest ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Quest Chaining ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Quest Trigger ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Quest History ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Quest Rewards ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Quest Generator ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
- Abandon Quest ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)

## Setup
## Documentation
### Nodes
- QuestManager
- Quest
- Task

### QuestManager
- Signals
- Variables
	- quests: Array
- Methods
	- load_quests(file_path: String)
	- generate_id(type: Enum)

### Quest
- Signals
	- started
	- finished
- Variables
	- title: String
	- description: String
	- tasks: Array
	- rewards: Array
	- status: Enum
	- trigger: Node
	- prerequisites: Array
	- priority: int
	- is_reoccurant: bool
	- collection_point: Node
- Methods
