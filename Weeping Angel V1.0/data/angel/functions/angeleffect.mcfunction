# freeze entity
execute as @s run tp @s @s

# looked at particle (title and effects as well maybe?)
execute as @s at @s run particle ash ~ ~1 ~ .5 .5 .5 1 10

# clear being looked at (done automatically in most cases, necessary for outliers.)
tag @s remove find_looking.result