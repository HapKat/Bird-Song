extends Node

var current_npc

func _ready():
	pass

func openDialogue(npc):
	var index = NPCStates.npc_progress.get(npc.name, {}).get("dialogue_index", 0)
	$"../DailogueScreen".open(npc, index)
	current_npc = npc
	print(index)
	NPCStates.npc_progress[npc.name]["dialogue_index"] += 1
