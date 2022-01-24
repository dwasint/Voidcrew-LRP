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

To do so we need to run another git command first to push the changes to the repo, before that though we need to configure git to use our account doing so is simple simply run

```
git config --global user.name "USERNAME" //for username
git config --global user.email "MY_NAME@example.com" //for email make sure to use your github email
```

Now that your username is set simply push the PR to your fork using this command replace fork with the name of your fork

```
git push --set-upstream origin fork
```

From your fork simply click on pull requests then new pull request

![](<../../.gitbook/assets/image (11).png>)

Now make sure to change the branch from master to the one you created as shown below

![](<../../.gitbook/assets/image (25).png>)

From there just follow the text in the PR description to describe what you want, having pictures of your Shuttle always helps.

## Congratulations you have no make a Pull Request all thats left to do is wait until it gets looked at to see if it gets merged rejected or they ask for changes&#x20;
