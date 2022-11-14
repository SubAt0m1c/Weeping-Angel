#storage for past systems or copy and pastes. Likely doesnt work and/or has major design flaws/different unwanted mechanics
execute as @a[tag=!lookingatangel,scores={lookingatangel=1..,lookedaway=0}] unless entity @s[tag=lookingatangel,scores={lookedaway=1..}] run scoreboard players set @s lookedaway 102
execute as @a[tag=lookingatangel,scores={lookedaway=1..,lookingatangel=0}] at @s run function angel:lookedtoolong2
execute as @a[tag=!lookedtoolong] run tag @s add canlookatangel
execute as @a[tag=lookedtoolong] run tag @s remove lookingatangel2
execute as @a[tag=canlookatangel,tag=!lookedtoolong] run function find_looking:find
execute as @a[tag=canlookatangel,tag=!lookedtoolong] at @s if predicate find_looking:can_see_filter run tag @s add lookingatangel2
execute as @e[tag=weeping] run tag @s add find_looking.candidate
execute as @e[tag=!weeping] run tag @s remove find_looking.candidate
execute as @e[tag=find_looking.result] at @s run function angel:angeleffect


execute as @a[scores={lookedtoolong=1..},tag=lookedtoolong] at @s run scoreboard players remove @s lookedtoolong 1
execute as @a[scores={lookingatangel=1..}] at @s run scoreboard players remove @s lookingatangel 1
execute as @a[tag=lookingatangel2,scores={lookingatangel=1..}] at @s run title @s actionbar {"text":"Dont look at the weeping angel for too long!","color":"red"}
execute as @a[scores={lookedaway=1..},tag=!lookingatangel2] at @s run title @s actionbar {"text":"Dont look back at the weeping angel yet!","color":"red"} 
execute as @a[tag=lookingatangel2,scores={lookingatangel=100}] at @s run title @s title {"text":"5","bold":true,"color":"dark_green"}
execute as @a[tag=lookingatangel2,scores={lookingatangel=81}] at @s run title @s title {"text":"4","bold":true,"color":"dark_green"}
execute as @a[tag=lookingatangel2,scores={lookingatangel=61}] at @s run title @s title {"text":"3","bold":true,"color":"yellow"}
execute as @a[tag=lookingatangel2,scores={lookingatangel=41}] at @s run title @s title {"text":"2","bold":true,"color":"gold"}
execute as @a[tag=lookingatangel2,scores={lookingatangel=21}] at @s run title @s title {"text":"1","bold":true,"color":"dark_red"}
execute as @a[tag=lookingatangel2,scores={lookingatangel=1}] at @s run function angel:lookedtoolong
execute as @a[scores={lookedtoolong=0},tag=lookedtoolong] at @s run tag @s remove lookedtoolong
execute as @a[tag=lookingatangel2,scores={lookingatangel=0}] at @s unless entity @s[scores={lookedaway=1..}] run scoreboard players set @s lookingatangel 101

execute as @a[scores={lookingatangel=1}] at @s run title @s title {"text":"","bold":true,"color":"dark_red"}
execute as @a[scores={lookedaway=1}] at @s run title @s actionbar {"text":"","bold":true,"color":"dark_red"}
execute as @a[tag=!lookingatangel2,scores={lookingatangel=1..}] at @s run title @s title {"text":"","bold":true,"color":"dark_red"}
execute as @a[scores={lookedaway=1..,},tag=!lookingatangel2] run scoreboard players remove @s lookedaway 1

execute as @a[tag=lookingatangel2] at @s unless predicate find_looking:can_see_filter run tag @s remove lookingatangel2