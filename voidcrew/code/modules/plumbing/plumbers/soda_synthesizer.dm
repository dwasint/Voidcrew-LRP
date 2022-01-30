///A single machine that produces a single chem. Can be placed in unison with others through plumbing to create chemical factories
/obj/machinery/plumbing/soda_synthesizer
	name = "soda synthesizer"
	desc = "Produces a single tyoe of soda at a given volume. Must be plumbed. Most effective when working in unison with other synthesizers and filters."

	icon_state = "synthesizer"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	rcd_cost = 25
	rcd_delay = 15

	///Amount we produce for every process. Ideally keep under 5 since thats currently the standard duct capacity
	var/amount = 1
	///The maximum we can produce for every process
	buffer = 5
	///I track them here because I have no idea how I'd make tgui loop like that
	var/static/list/possible_amounts = list(0,1,2,3,4,5)
	///The reagent we are producing. We are a typepath, but are also typecast because there's several occations where we need to use initial.
	var/datum/reagent/reagent_id = null
	///straight up copied from chem dispenser. Being a subtype would be extremely tedious and making it global would restrict potential subtypes using different dispensable_reagents
	var/list/dispensable_reagents = list(
		/datum/reagent/water,
		/datum/reagent/consumable/ice,
		/datum/reagent/consumable/coffee,
		/datum/reagent/consumable/cream,
		/datum/reagent/consumable/tea,
		/datum/reagent/consumable/icetea,
		/datum/reagent/consumable/space_cola,
		/datum/reagent/consumable/spacemountainwind,
		/datum/reagent/consumable/dr_gibb,
		/datum/reagent/consumable/space_up,
		/datum/reagent/consumable/tonic,
		/datum/reagent/consumable/sodawater,
		/datum/reagent/consumable/lemon_lime,
		/datum/reagent/consumable/pwr_game,
		/datum/reagent/consumable/shamblers,
		/datum/reagent/consumable/sugar,
		/datum/reagent/consumable/pineapplejuice,
		/datum/reagent/consumable/orangejuice,
		/datum/reagent/consumable/grenadine,
		/datum/reagent/consumable/limejuice,
		/datum/reagent/consumable/tomatojuice,
		/datum/reagent/consumable/lemonjuice,
		/datum/reagent/consumable/menthol,
	)

/obj/machinery/plumbing/soda_synthesizer/Initialize(mapload, bolt)
	. = ..()
	AddComponent(/datum/component/plumbing/simple_supply, bolt)

/obj/machinery/plumbing/soda_synthesizer/process()
	if(machine_stat & NOPOWER || !reagent_id || !amount)
		return
	if(reagents.total_volume >= amount) //otherwise we get leftovers, and we need this to be precise
		return
	reagents.add_reagent(reagent_id, amount)

/obj/machinery/plumbing/soda_synthesizer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemSynthesizer", name)
		ui.open()

/obj/machinery/plumbing/soda_synthesizer/ui_data(mob/user)
	var/list/data = list()

	var/is_hallucinating = user.hallucinating()
	var/list/chemicals = list()

	for(var/A in dispensable_reagents)
		var/datum/reagent/R = GLOB.chemical_reagents_list[A]
		if(R)
			var/chemname = R.name
			if(is_hallucinating && prob(5))
				chemname = "[pick_list_replacements("hallucination.json", "chemicals")]"
			chemicals.Add(list(list("title" = chemname, "id" = ckey(R.name))))
	data["chemicals"] = chemicals
	data["amount"] = amount
	data["possible_amounts"] = possible_amounts

	data["current_reagent"] = ckey(initial(reagent_id.name))
	return data

/obj/machinery/plumbing/soda_synthesizer/ui_act(action, params)
	. = ..()
	if(.)
		return
	. = TRUE
	switch(action)
		if("amount")
			var/new_amount = text2num(params["target"])
			if(new_amount in possible_amounts)
				amount = new_amount
				. = TRUE
		if("select")
			var/new_reagent = GLOB.name2reagent[params["reagent"]]
			if(new_reagent in dispensable_reagents)
				reagent_id = new_reagent
				. = TRUE
	update_icon()
	reagents.clear_reagents()

/obj/machinery/plumbing/soda_synthesizer/update_overlays()
	. = ..()
	var/mutable_appearance/r_overlay = mutable_appearance(icon, "[icon_state]_overlay")
	if(reagent_id)
		r_overlay.color = initial(reagent_id.color)
	else
		r_overlay.color = "#FFFFFF"
	. += r_overlay
