# kdb+/q — Install and VS Code setup

This repository contains q examples. Below are concise instructions to install the q (kdb+) runtime on Windows and configure Visual Studio Code for editing and running q scripts.

## 1. Download and install q (kdb+)

1. Download kdb+/q for Windows from the official Kx downloads page: https://kx.com/download/
2. Choose the Windows package matching your system (64-bit recommended) and accept any license prompts.
3. Extract the downloaded zip to a folder, for example `C:\q`.

## 2. Add q to your PATH (so `q` runs from any terminal)

- Option A — Windows GUI:
	- Open **Edit the system environment variables** → **Environment Variables...** → under **System variables** select `Path` → **Edit** → **New** and add `C:\q` (or the folder where you extracted `q.exe`).
- Option B — PowerShell (run as your normal user; open a new terminal after running):

```powershell
# Append C:\q to your user PATH (adjust if q is in a different folder)
setx PATH "$($env:PATH);C:\q"
```

Note: After changing PATH, open a new PowerShell/Command Prompt for the change to take effect.

## 3. Verify the installation

Open a new terminal and run:

```powershell
q
```

You should see the q prompt. To exit, press Ctrl+C or use the q command to quit.

## 4. Set up Visual Studio Code for q development

1. Install Visual Studio Code: https://code.visualstudio.com/
2. Install a q language extension: open the Extensions view (Ctrl+Shift+X) and search for `q` or `kdb`. Install a community or vendor extension that provides syntax highlighting and basic language support. (Extension names vary; choose a well-rated one.)
3. Open this repository folder in VS Code.

### Run q scripts from VS Code (task)

Create a task to run the current file quickly. In VS Code create or update `.vscode/tasks.json` with the following content:

```json
{
	"version": "2.0.0",
	"tasks": [
		{
			"label": "Run q file",
			"type": "shell",
			"command": "q",
			"args": ["${file}"],
			"group": { "kind": "build", "isDefault": true },
			"presentation": { "reveal": "always", "panel": "shared" }
		}
	]
}
```

Run the task via **Terminal → Run Task... → Run q file** or use the default build shortcut (Ctrl+Shift+B) if configured.

## 5. Tips & troubleshooting

- If `q` is not recognized, confirm `C:\q` (or your install folder) is in PATH and open a new terminal.
- To run a specific script from a terminal: `q path\to\script.q` or `C:\q\q.exe script.q`.
- If you need documentation or examples, see the official Kx docs: https://code.kx.com/

If you want, I can add a sample `.vscode/tasks.json` file to this repo or show how to configure common editor settings next.

