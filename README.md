# Enable PowerShell Scripts
This help for enable/disable Powershell script by one click. This enables PowerShell script execution in **Unrestricted mode**, disables **UAC** and **Smart App Control** to allow scripts to run without interruption, and modifies registry keys related to execution policy and system restrictions. An option allows you to **revert to default settings**, restoring **Restricted** mode. Everything is **safe** and **fully reversible**.

## Support
If you need any help or have questions, feel free to join the **[Discord support server](https://discord.com/invite/fayeECjdtb)** — I'll be happy to assist you.

## Installation & Launch
**Right-click** the `Set-PSExecution.bat` file → **"Run as administrator"**.  
The script will automatically request administrator privileges.

**Once launched**, a menu will prompt you to choose an action.

## Menu options
| Option | Description |
|---|---|
| **`1` Enable** | *Enables Unrestricted mode + disables UAC + disables Smart App Control* |
| **`2` Revert** | *Restores Restricted mode* |

> [!IMPORTANT]
> A **restart is recommended** after applying changes for them to take full effect.

## What the script does
| Action | What it does |
|---|---|
| **Unrestricted Mode** | Allows all PowerShell scripts to run regardless of signature or origin |
| **UAC Disabled** | Removes privilege elevation prompts to allow seamless script automation |
| **Smart App Control Disabled** | Prevents Windows 11 from blocking unrecognized scripts and apps |
| **Registry keys** | Modifies execution policy and system restriction registry entries |

## Uninstall / Reset
Simply re-run the script and select option **`2` Revert**.  
This will restore:
- PowerShell `ExecutionPolicy` → **Restricted**

> [!NOTE]
> The script does not delete or modify any user files. All changes are limited to registry keys and can be fully reverted at any time.

## Additional info
> [!CAUTION]
> Disabling UAC reduces a layer of Windows security. It is recommended to **revert to default settings** once you are done running your scripts if you do not need permanent unrestricted access.

> [!CAUTION]
> **Smart App Control** (Windows Security → Smart App Control) may also block script execution even with Unrestricted mode enabled.  
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
