# How to Make a PR

Now that you have a super awesome shuttle and you wanna share it First things first though we need to make a config for it.

Doing so is very simple I'll have a template below for easier use.

```
{
	"map_name": "What you want to Call It",
	"map_short_name": "Usually the class ",
	"map_path": "_maps/shuttles/shiptest/voidcrew/yourshuttle.dmm",
	"map_id": "yourshuttle",
	"job_slots": {
		"job" : slots,
		"job" : slots // you can keep adding more slots and jobs as you see fit
	},
	"cost": 000 //how much meta coins you want it to cost
}

```

This file is located at  _maps/configs and its good practice to name it the same as your map so for operation\_honk it was operation\_honk.dmm and operation\_honk.json_

## _Now that that is done we can move on the actually pushing it for review._

Doing this is very simple First thing first we need to make sure our changes are commited and pushed to the website to do that simply do as follows

Step 1) Commit to branch

![](<../../.gitbook/assets/image (41).png>)

Step 2) Publish Branch

![](<../../.gitbook/assets/image (31).png>)

Step 3) Make PR

![](<../../.gitbook/assets/image (26).png>)

## Some Tips for a good PR.

* Include images of the map in question, if its changes to a map just a zoom in on the changes is nice
* Make sure it follows our current naming convention a template will be below
* Make sure to keep your branches up to date with the master so make sure to merge commits from the website
* Make sure your shuttle is in the correct modularization folder located at \_maps/shuttles/shiptest/voidcrew

```
CONFIG NAME : FACTION_classname_extra-VOID.json
MAP NAME : class_extra
```

## Congratulations you have now made a Pull Request.
