# run every function for each player individually
execute as @a run function angel:looking
# angel beeing looked at effect
execute as @e[tag=find_looking.result] run function angel:angeleffect

#make weeping mobs capable of being looked at
execute as @e[tag=weeping] run tag @s add find_looking.candidate
execute as @e[tag=!weeping] run tag @s remove find_looking.candidate

#looked too long timer and titles
execute as @a[scores={lookedtoolong=1..}] run scoreboard players remove @s lookedtoolong 1
execute as @a[scores={lookedtoolong=2..}] run title @s actionbar {"text":"You looked for too long!","bold":true,"color":"red"}
execute as @a[scores={lookedtoolong=1}] run title @s actionbar {"text":"","bold":true,"color":"red"}
execute as @a[scores={lookedtoolong=1}] run tag @s remove lookedtoolong