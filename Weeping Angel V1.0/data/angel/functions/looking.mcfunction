# check if looking
execute as @s[tag=!lookedtoolong] at @s run function find_looking:find

# fix scores
execute as @s[tag=!lookedtoolong] unless entity @s[scores={lookingatangel=0..}] run scoreboard players set @s lookingatangel 0
execute as @s[tag=!lookedtoolong] unless entity @s[scores={lookingatangelcooldown=0..}] run scoreboard players set @s lookingatangelcooldown 0
execute as @s[tag=!lookedtoolong] unless entity @s[scores={lookingatangelstore=0..}] run scoreboard players set @s lookingatangelstore 0

# debug tag (litterally not used anywhere whatsoever)
execute as @s unless predicate find_looking:can_see_filter run tag @s remove angel.looking
execute as @s if predicate find_looking:can_see_filter run tag @s add angel.looking

# look away cooldown
execute as @s[scores={lookingatangel=1..,lookingatangelstore=0}] unless predicate find_looking:can_see_filter run scoreboard players set @s lookingatangelcooldown 101

# remove looking storage when cooldown is over
execute as @s[scores={lookingatangelstore=1..,lookingatangelcooldown=1}] run scoreboard players set @s lookingatangelstore 0

# first look check succeed
execute as @s[scores={lookingatangel=0,lookingatangelstore=0}] if predicate find_looking:can_see_filter run playsound entity.allay.ambient_without_item master @s ~ ~ ~ 200 0.5
execute as @s[scores={lookingatangel=0,lookingatangelstore=0}] if predicate find_looking:can_see_filter run scoreboard players set @s lookingatangel 101

# looked back titles
execute as @s[scores={lookingatangel=0,lookingatangelstore=81..}] if predicate find_looking:can_see_filter run title @s title {"text":"5","bold":true,"color":"dark_green"}
execute as @s[scores={lookingatangel=0,lookingatangelstore=61..80}] if predicate find_looking:can_see_filter run title @s title {"text":"4","bold":true,"color":"dark_green"}
execute as @s[scores={lookingatangel=0,lookingatangelstore=41..60}] if predicate find_looking:can_see_filter run title @s title {"text":"3","bold":true,"color":"yellow"}
execute as @s[scores={lookingatangel=0,lookingatangelstore=21..40}] if predicate find_looking:can_see_filter run title @s title {"text":"2","bold":true,"color":"gold"}
execute as @s[scores={lookingatangel=0,lookingatangelstore=1..20}] if predicate find_looking:can_see_filter run title @s title {"text":"1","bold":true,"color":"dark_red"}

# move score store to main
execute as @s[scores={lookingatangel=0,lookingatangelstore=1..}] if predicate find_looking:can_see_filter run scoreboard players operation @s lookingatangel = @s lookingatangelstore
execute as @s[scores={lookingatangel=1..,lookingatangelstore=1..}] if predicate find_looking:can_see_filter run scoreboard players set @s lookingatangelstore 0

# looking timer score
execute as @s[scores={lookingatangel=1..}] if predicate find_looking:can_see_filter run scoreboard players remove @s lookingatangel 1

# clear titles
execute as @s[scores={lookingatangel=1..,lookingatangelstore=0}] unless predicate find_looking:can_see_filter run title @s title {"text":"","bold":true,"color":"dark_green"}
execute as @s[scores={lookingatangel=1..,lookingatangelstore=0}] unless predicate find_looking:can_see_filter run title @s actionbar {"text":"","bold":true,"color":"dark_green"}

# store looking timer score
execute as @s[scores={lookingatangel=1..,lookingatangelstore=0}] unless predicate find_looking:can_see_filter store result score @s lookingatangelstore run scoreboard players get @s lookingatangel

# looking cooldown timer score
execute as @s[scores={lookingatangelcooldown=1..}] unless predicate find_looking:can_see_filter run scoreboard players remove @s lookingatangelcooldown 1
execute as @s[scores={lookingatangelcooldown=1..}] if predicate find_looking:can_see_filter run scoreboard players set @s lookingatangelcooldown 0

# main score clear when looking away
execute as @s[scores={lookingatangel=1..,lookingatangelstore=1..}] unless predicate find_looking:can_see_filter run scoreboard players set @s lookingatangel 0

# looked away titles
execute as @a[scores={lookingatangelcooldown=2..}] unless predicate find_looking:can_see_filter run title @s actionbar {"text":"Dont look back at the weeping angel yet!","color":"red"}
execute as @a[scores={lookingatangelcooldown=1}] unless predicate find_looking:can_see_filter run title @s actionbar {"text":"","color":"red"}

# looking timer titles
execute as @a[scores={lookingatangel=1..}] at @s if predicate find_looking:can_see_filter run title @s actionbar {"text":"Dont look at the weeping angel for too long!","color":"red"}
execute as @a[scores={lookingatangel=100}] at @s if predicate find_looking:can_see_filter run title @s title {"text":"5","bold":true,"color":"dark_green"}
execute as @a[scores={lookingatangel=81}] at @s if predicate find_looking:can_see_filter run title @s title {"text":"4","bold":true,"color":"dark_green"}
execute as @a[scores={lookingatangel=61}] at @s if predicate find_looking:can_see_filter run title @s title {"text":"3","bold":true,"color":"yellow"}
execute as @a[scores={lookingatangel=61}] at @s if predicate find_looking:can_see_filter run playsound entity.allay.hurt master @s ~ ~ ~ 2 0.5
execute as @a[scores={lookingatangel=41}] at @s if predicate find_looking:can_see_filter run title @s title {"text":"2","bold":true,"color":"gold"}
execute as @a[scores={lookingatangel=41}] at @s if predicate find_looking:can_see_filter run playsound entity.allay.ambient_with_item master @s ~ ~ ~ 200 0.5
execute as @a[scores={lookingatangel=21}] at @s if predicate find_looking:can_see_filter run title @s title {"text":"1","bold":true,"color":"dark_red"}
execute as @a[scores={lookingatangel=21}] at @s if predicate find_looking:can_see_filter run playsound minecraft:entity.allay.item_taken master @s ~ ~ ~ 200 0.1 

# looked too long
execute as @s[scores={lookingatangel=1}] if predicate find_looking:can_see_filter run function angel:lookedtoolong