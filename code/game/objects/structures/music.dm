/obj/structure/music_box
	name = "music box"
	desc = "that stuff do music"
	icon = 'icons/obj/fallout/crafting.dmi'
	icon_state = "Tape_recorder_tape"
	density = FALSE
	anchored = TRUE
	var/cooldown = 0
	var/cooldown_time = 300 SECONDS

/obj/structure/music_box/attack_hand(mob/living/user)
	var/current_time = world.time
	if(current_time < cooldown)
		var/wait_time = (cooldown - current_time) / 10
		to_chat(user, "<span class='warning'>Music box needs [wait_time] seconds cooldown!</span>")
		return

	user.visible_message("Music has started")
	playsound(src, 'sound/music/The_Choir_of_Your_Cross.ogg', 50, TRUE)
	cooldown = current_time + cooldown_time
