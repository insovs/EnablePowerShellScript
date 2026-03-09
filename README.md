# EnablePowerShellScript
This help for enable/disable Powershell script by one click.


# Enable PowerShell Scripts

This script enables PowerShell script execution in **Unrestricted mode**, disables **UAC** to allow scripts to run without interruption, and automatically **unblocks all files** in the script's directory.  
It also modifies registry keys related to execution policy, PowerShell logging and system restrictions. An option allows you to **revert to default settings**, restoring **Restricted** mode and fully re-enabling UAC. Everything is **safe** and **fully reversible**.

[▶ Watch the video](https://youtu.be/JIATuKskBmk)

## `1` Installation & Launch

**Right-click** the `insopti-PSUnlock.bat` file → **"Run as administrator"**.  
The script will automatically request administrator privileges.

Once launched, a menu will prompt you to choose an action.

## Menu options

| Option | Description |
|---|---|
| **`1` Allow Script** | Enables Unrestricted mode + disables UAC + unblocks all files |
| **`2` Revert default** | Restores Restricted mode + re-enables UAC |
| **`3` Exit** | Closes the script |

> [!IMPORTANT]
> A **restart is recommended** after applying changes for them to take full effect.

## What the script does

| Action | What it does |
|---|---|
| **Unrestricted Mode** | Allows all PowerShell scripts to run regardless of signature or origin |
| **UAC Disabled** | Removes privilege elevation prompts to allow seamless script automation |
| **File Unblocking** | Removes the `Zone.Identifier` mark from files downloaded from the internet, suppressing Windows security warnings |
| **Registry keys** | Modifies execution policy, PowerShell logging and system restriction registry entries |

## Uninstall / Reset

Simply re-run the script and select option **`2` Revert default**.  
This will restore:
- PowerShell `ExecutionPolicy` → **Restricted**
- UAC → **re-enabled**
- All logging policies → **restored**

> [!NOTE]
> The script does not delete or modify any user files. All changes are limited to registry keys and can be fully reverted at any time.

## Additional info

> [!CAUTION]
> Disabling UAC reduces a layer of Windows security. It is recommended to **revert to default settings** once you are done running your scripts if you do not need permanent unrestricted access.

> [!IMPORTANT]
> This script is intended to be used alongside **insopti-PowerPlan** or any other `.ps1` script that requires elevated execution permissions.

---

<p align="center">
  <sub>©insopti — <a href="https://guns.lol/inso.vs">guns.lol/inso.vs</a> | For personal use only.</sub>
</p>
