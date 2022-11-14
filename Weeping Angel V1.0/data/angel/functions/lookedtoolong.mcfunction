# looked too long title, sound, and effects
execute as @s at @s run title @s subtitle {"text":"You looked for too long!","bold":true,"color":"red"}
execute as @s at @s run playsound minecraft:entity.allay.death master @s ~ ~ ~ 2 0.5
effect give @s blindness 10 0 true
effect give @s weakness 10 4 true
effect give @s mining_fatigue 10 3 true

# looked too long unable to look
tag @s add lookedtoolong
tag @s remove angel.looking
tag @s remove canlookatangel
scoreboard players reset @s lookingatangel
scoreboard players reset @s lookingatangelcooldown
scoreboard players reset @s lookingatangelstore

# timer title clear
title @s title {"text":"","bold":true,"color":"dark_red"}

# looked too long timer score
execute as @s unless entity @s[scores={lookedtoolong=1..}] run scoreboard players set @s lookedtoolong 200