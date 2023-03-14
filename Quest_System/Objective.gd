extends Node

var id: int
var description: String
var completed: bool = false

func init(id: int, description: String) -> Node:
	self.id = id
	self.description = description
	
	return self
