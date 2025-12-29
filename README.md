# ag-bucket_fix

Bucket Fix for QBox

# Author: AG Studios
# Description:
# Prevents “different worlds / invisible players” issues caused by TX Menu, interiors, apartments, or other scripts that use routing buckets. Fully QBox-compatible, admin-only fixes, and automatic fail-safe resets.

Features

Forces all players into bucket 0 on connect and spawn.

Admin-only /fixplayer [id] command to manually reset any player's routing bucket.

Automatic admin bucket sync when teleporting to another player (bucket_fix:syncBucket).

Fail-safe: players accidentally stuck in another bucket are automatically reset every 5 seconds.

Fully compatible with QBox, TX Menu, apartments, gang labs, and interiors.

Prevents players from needing to fix themselves.

Installation

Place the bucket_fix folder inside your server resources/ directory:

# resources/
  └─ bucket_fix/
     ├─ fxmanifest.lua
     ├─ server.lua
     └─ client.lua


Add the resource to your server.cfg:

ensure bucket_fix


Restart your server or start the resource manually:

# ensure ag-bucket_fix

Commands
/fixplayer [id]

Who can use: Admins only

Purpose: Reset a player’s routing bucket to bucket 0

Example: /fixplayer 12 → resets player with ID 12

bucket_fix:syncBucket (event)

Who can trigger: Admin scripts only

Purpose: Sync admin routing bucket with a target player (for teleport scripts)

Example in TP script:

TriggerServerEvent('bucket_fix:syncBucket', targetPlayerId)

How It Works

Automatic bucket reset: Players are forced into bucket 0 on spawn and connect.

Fail-safe loop: Client checks every 5 seconds to make sure the player is in bucket 0.

Admin teleport sync: Ensures admins can always see players when using TP scripts or TX Menu.

Manual admin fixes: Admins can reset any player at any time with /fixplayer.

Notes

This resource does not interfere with intentional bucket usage for gameplay (like private interiors or heists) — it only fixes players accidentally left in the wrong bucket.

For advanced setups, you can modify the client fail-safe to ignore specific instances if needed.

Compatibility

QBox Framework (tested with latest QBox build)

Compatible with: TX Menu, apartments, gang labs, drug labs, and any script using routing buckets.

License

This script is free to use on your server, but do not redistribute without permission.

I can also make a shorter, “user-friendly” version with diagrams showing how admins use /fixplayer and teleport syncing — useful if you want to give it to other staff.

Do you want me to make that visual, staff-friendly version too?
