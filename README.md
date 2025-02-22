[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?OfficerMills+anuraghazra)](https://github.com/anuraghazra/github-readme-stats)

# FiveM Zippo Lighter Script


<div align="middle">
    <img width="auto" src="https://user-images.githubusercontent.com/91661118/154636617-a2ad4c09-4b60-4438-832a-ed1c505b52ea.png"/>
</div>

This script allows players to use a **Flint Wheel Lighter** item in your FiveM server to start fires, with fire spreading dynamically. The configuration is highly customizable, allowing you to define fire growth behavior, animation settings, and placement offsets.

---

## Installation Instructions

### 1. Dependencies
This script requires the following dependencies:
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)


### 2. Adding the Item
Add the following item to your `shared/items.lua` file in the qb-core folder:

```lua
zippo_lighter = { name = "zippo_lighter", label = "Flint Lighter", weight = 200, type = "item", image = "zippo_lighter.png", unique = false, useable = true, description = "A classic Zippo lighter." }

}
```

Ensure you also add the image from the [IMAGES](https://github.com/OfficerMills/om-lighter/tree/main/om-lighter%2FIMAGES) folder `zippo_lighter.png` to your inventory UI's image folder.

### 3. Script Installation
1. **Place the Script**:
   - Copy the `om-lighter` folder into your server's `resources` directory.

2. **Start the Script**:
   - Add the following line to your `server.cfg`:
     ```
     ensure om-lighter
     ```

3. **Configuration**:
   - Edit the `config.lua` file to adjust settings like fire growth, animation duration, debug logging, and placement offsets.(Not recommend to adjust for spread/size unless you know what you are doing).

### 4. Usage
- Players can use the `zippo_lighter` item from their inventory to light fires.
- Fires will grow and spread dynamically based on the configured settings.

### 5. Optional Debugging
To enable debug logs for troubleshooting, set `Config.Debug = true` in `config.lua`.

> Add the `zippo_lighter` item to a shop, a black market script, or a crafting script of your choice for player accessibility.

---

## Configuration Details

### Fire Spread
- **MinChildren**: Minimum child fires spawned per step.
- **MaxChildren**: Maximum child fires spawned per step.
- **InitialRadius**: The starting radius of the fire.
- **MinRadius**: The minimum radius for fire growth.
- **MaxRadius**: The maximum radius for fire growth.
- **ChildFireDistance**: Distance between each child fire.
- **DelayBetweenGrowth**: Time in milliseconds between fire growth steps.
- **MaxFiresPerStep**: Maximum fires spawned in one growth step.

### Animation
- **Dict**: The animation dictionary to use when lighting the fire.
- **Name**: The animation name to play.
- **Duration**: How long the animation lasts (in milliseconds).

---

## Support
For any issues or questions, feel free to reach out.
https://discord.gg/OfficerMills
