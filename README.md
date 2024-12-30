Repair Kit Script for QB/Qbox

Use repair kit item from your inventory inside your vehicle or will use the nearest vehicle to your ped

## Installation

Drag and drop jdbnet-repairkit into your server resources

ensure jdbnet-repairkit

Add the following to ox_inventory/data/items.lua...

```lua
	["repairkit"] = {
		label = "Repair Kit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},
```

Add the image from jdbnet-repairkit/img/ to ox_inventory/web/images/