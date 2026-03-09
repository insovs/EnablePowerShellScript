# Enable PowerShell Scripts
This help for enable/disable Powershell script by one click. This enables PowerShell script execution in **Unrestricted mode**, disables **UAC** to allow scripts to run without interruption, and automatically **unblocks all files** in the script's directory. It also modifies registry keys related to execution policy, PowerShell logging and system restrictions. An option allows you to **revert to default settings**, restoring **Restricted** mode and fully re-enabling UAC. Everything is **safe** and **fully reversible**.

## Installation & Launch

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

> [!CAUTION]
> **Smart App Control** (Windows Security → Smart App Control) may also block script execution even with Unrestricted mode enabled.  
> If the script still won't run, go to **Windows Security** → **App & browser control** → **Smart App Control** and set it to **Off**.  
> Note: once disabled, Smart App Control **cannot be re-enabled without reinstalling Windows**.

<details>
  <summary>Click here to show how to disable Smart App Control</summary>

![step1](https://imgur.com/Za4xyNP.png)
![step2](https://imgur.com/ib0r4po.png)

</details>

---

<p align="center">
  <sub>©insopti — <a href="https://guns.lol/inso.vs">guns.lol/inso.vs</a> | For personal use only.</sub>
</p>
