<div align="center">

# Enable PowerShell Scripts

Enable or disable PowerShell script execution on Windows in one click.<br>
Sets **Unrestricted mode**, disables **UAC** & **Smart App Control**, and **unblocks all files** in the script directory.<br>
A revert option restores **Restricted mode** at any time. Everything is **safe** and **fully reversible**.

[![Discord](https://img.shields.io/badge/Support-Discord-5865F2?logo=discord&logoColor=white)](https://discord.com/invite/fayeECjdtb)

</div>

---

## Installation

**Right-click** `Set-PSExecution.bat` → **Run as administrator**

The script will automatically request administrator privileges, then prompt you to choose an action.

---

## Menu

| Option | Action |
|:------:|--------|
| **`1`** | Enable — Unrestricted mode + UAC off + Smart App Control off + Unblock files |
| **`2`** | Revert — Restricted mode only |

> [!IMPORTANT]
> A **restart is required** after applying changes for them to take full effect.

---

## What the script does

| Action | Description |
|--------|-------------|
| **Unrestricted Mode** | Allows all `.ps1` scripts to run regardless of signature or origin |
| **UAC Disabled** | Removes elevation prompts to allow seamless script automation |
| **Smart App Control Disabled** | Stops Windows 11 from blocking unrecognized scripts and apps |
| **File Unblocking** | Removes the `Zone.Identifier` tag from files downloaded from the internet |
| **Registry Keys** | Modifies execution policy, PowerShell logging and system restriction entries |

<details>
<summary><b>► Unrestricted Mode</b></summary>
<br>

By default, Windows blocks all `.ps1` scripts from running. `Unrestricted` mode removes this restriction entirely, allowing any script to execute regardless of its origin or signature.
The script applies this at both the **user level** and **machine level**, and also overrides any Group Policy that might enforce a stricter setting.

</details>

<details>
<summary><b>► UAC (User Account Control)</b></summary>
<br>

The UAC prompt appears every time an app tries to make changes to your system. Disabling it prevents these interruptions so scripts can run without requiring manual approval each time.

Disabling UAC reduces a layer of Windows security. Revert to default settings or re-enable it once you no longer need unrestricted access.

<img alt="UAC prompt" src="https://github.com/user-attachments/assets/b811ae7f-6a4d-4271-b92b-5d7044061c14" />

</details>

<details>
<summary><b>► Smart App Control</b></summary>
<br>

Smart App Control is a Windows 11 feature that blocks apps and scripts it doesn't recognize. Even with `Unrestricted` mode enabled, SAC can still silently prevent your scripts from running. The script disables it automatically via the registry.

> [!CAUTION]
> Once disabled, Smart App Control **cannot be re-enabled without reinstalling Windows**.

<img alt="Smart App Control steps" src="https://github.com/user-attachments/assets/e16bf1e9-dbfc-4dd2-bf1f-636c1515099f" />

</details>

<details>
<summary><b>► Zone.Identifier</b></summary>
<br>

When you download a file from the internet, Windows silently attaches a hidden tag called `Zone.Identifier`. This marks the file as untrusted and causes Windows to block or warn when you try to run it — even with `ExecutionPolicy` set to `Unrestricted`. The script removes this tag automatically from all files in its directory.

You can also remove it manually: right-click any file → **Properties** → check **Unblock** → **OK**.

</details>

<details>
<summary><b>► Registry Keys</b></summary>
<br>

| Registry Key | What it controls |
|---|---|
| `HKCU\...\ShellIds\Microsoft.PowerShell` → `ExecutionPolicy` | Per-user execution policy |
| `HKLM\...\ShellIds\Microsoft.PowerShell` → `ExecutionPolicy` | Machine-wide execution policy |
| `HKLM\...\Windows\PowerShell` → `ExecutionPolicy` + `EnableScripts` | Group Policy override |
| `HKLM\...\PowerShell\ModuleLogging` | Disables module logging |
| `HKLM\...\PowerShell\ScriptBlockLogging` | Disables script block logging |
| `HKLM\...\PowerShell\Transcription` | Disables transcription logging |
| `HKLM\...\Policies\System` → `EnableLUA` | UAC on / off |
| `HKLM\SYSTEM\...\CI\Policy` → `VerifiedAndReputablePolicyState` | Smart App Control on / off |

</details>

---

## Revert / Reset

Re-run the script and select **`2` Revert**. This will restore:

- PowerShell `ExecutionPolicy` → **Restricted**
- All PowerShell logging policies → **restored**

> [!NOTE]
> Revert does **not** touch UAC or Smart App Control. No user files are modified. All changes are limited to registry keys and can be undone at any time.

---

> [!CAUTION]
> Disabling UAC reduces a layer of Windows security. Revert to default settings once you no longer need unrestricted access.

---

<div align="center">
  <sub>©insopti — <a href="https://guns.lol/inso.vs">guns.lol/inso.vs</a> · For personal use only.</sub>
</div>
