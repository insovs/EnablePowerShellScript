# Enable PowerShell Scripts
This help for enable/disable Powershell script by one click. This enables PowerShell script execution in **Unrestricted mode**, disables **UAC** and **Smart App Control** to allow scripts to run without interruption, and automatically **unblocks all files** in the script's directory. It also modifies registry keys related to execution policy, PowerShell logging and system restrictions. An option allows you to **revert to default settings**, restoring **Restricted** mode only. Everything is **safe** and **fully reversible**.

## Support
If you need any help or have questions, feel free to join the **[Discord support server](https://discord.com/invite/fayeECjdtb)** — I'll be happy to assist you.

## Installation & Launch
**Right-click** the `Set-PSExecution.bat` file → **"Run as administrator"**.  
The script will automatically request administrator privileges.

**Once launched**, a menu will prompt you to choose an action.

## Menu options
| Option | Description |
|---|---|
| **`1` Enable** | *Enables Unrestricted mode + disables UAC + disables Smart App Control + unblocks files* |
| **`2` Revert** | *Restores Restricted mode only* |

> [!IMPORTANT]
> A **restart is recommended** after applying changes for them to take full effect.

## What the script does
| Action | What it does |
|---|---|
| **Unrestricted Mode** | Allows all PowerShell scripts to run regardless of signature or origin |
| **UAC Disabled** | Removes privilege elevation prompts to allow seamless script automation |
| **Smart App Control Disabled** | Prevents Windows 11 from blocking unrecognized scripts and apps |
| **File Unblocking** | Removes the `Zone.Identifier` mark from files downloaded from the internet |
| **Registry keys** | Modifies execution policy, PowerShell logging and system restriction registry entries |

<details>
  <summary>► Unrestricted Mode</summary>

By default, Windows blocks all `.ps1` scripts from running. `Unrestricted` mode removes this restriction entirely, allowing any script to execute regardless of its origin or signature. The script sets this both at the user level and machine level, and also overrides any Group Policy that might enforce a stricter policy.
</details>

<details>
  <summary>► UAC</summary>

The UAC (User Account Control) prompt appears every time an app tries to make changes to your system. Disabling it prevents these interruptions so scripts can run without needing manual approval each time.

<img width="1536" height="864" alt="image" src="https://github.com/user-attachments/assets/b811ae7f-6a4d-4271-b92b-5d7044061c14" />
</details>

<details>
  <summary>► Smart App Control</summary>

Smart App Control is a Windows 11 feature that blocks apps and scripts it doesn't recognize. Even with `Unrestricted` mode enabled, SAC can still prevent your scripts from running. The script disables it automatically via the registry.

> ⚠️ Once disabled, Smart App Control **cannot be re-enabled without reinstalling Windows**.

![step1](https://imgur.com/Za4xyNP.png)
![step2](https://imgur.com/ib0r4po.png)
</details>

<details>
  <summary>► Zone.Identifier</summary>

When you download a file from the internet, Windows silently attaches a hidden tag called `Zone.Identifier`. This marks the file as coming from an untrusted source and causes Windows to block or warn when you try to run it — even with `ExecutionPolicy` set to `Unrestricted`. The script removes it automatically from all files in its directory.

You can also remove it manually: right-click any file → **Properties** → check **Unblock** at the bottom → **OK**.
</details>

<details>
  <summary>► Registry keys</summary>

| Key | What it controls |
|-----|-----------------|
| `HKCU\...\ShellIds\Microsoft.PowerShell` → `ExecutionPolicy` | Per-user execution policy |
| `HKLM\...\ShellIds\Microsoft.PowerShell` → `ExecutionPolicy` | Machine-wide execution policy |
| `HKLM\...\Windows\PowerShell` → `ExecutionPolicy` + `EnableScripts` | Group Policy override |
| `HKLM\...\PowerShell\ModuleLogging` | Disables module logging |
| `HKLM\...\PowerShell\ScriptBlockLogging` | Disables script block logging |
| `HKLM\...\PowerShell\Transcription` | Disables transcription logging |
| `HKLM\...\Policies\System` → `EnableLUA` | UAC on/off |
| `HKLM\SYSTEM\...\CI\Policy` → `VerifiedAndReputablePolicyState` | Smart App Control on/off |
</details>

## Uninstall / Reset
Simply re-run the script and select option **`2` Revert**.  
This will restore:
- PowerShell `ExecutionPolicy` → **Restricted**
- All logging policies → **restored**

> [!NOTE]
> Revert does **not** touch UAC or Smart App Control. The script does not delete or modify any user files. All changes are limited to registry keys.

## Additional info
> [!CAUTION]
> Disabling UAC reduces a layer of Windows security. It is recommended to **revert to default settings** once you are done running your scripts if you do not need permanent unrestricted access.

> [!CAUTION]
> Once **Smart App Control** is disabled, it **cannot be re-enabled without reinstalling Windows**.

---
<p align="center">
  <sub>©insopti — <a href="https://guns.lol/inso.vs">guns.lol/inso.vs</a> | For personal use only.</sub>
</p>
