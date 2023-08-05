# Titan

These scripts come without warranty of any kind. Use them at your own risk. I assume no liability for the accuracy, correctness, completeness, or usefulness of any information provided by this site nor for any sort of damages using these scripts may cause.
**DO NOT INSTALL THESE SCRIPTS TO A DOMAIN CONTROLLER.**

Create a dedicated VM running Windows Server 2019 or Windows 10 Pro 1809+ for your automation scripts.

## Requirements
Git ````https://git-scm.com/download/win````

Powershell 7 ````https://github.com/PowerShell/powershell/releases````

# Suggested Install Process
````
mkdir \scripts
cd \scripts
git clone https://github.com/AR-k12code/titan.git
````

## Initial Settings File
````
cd \scripts\Titan
Copy-Item resources\settings_sample.ps1 .\settings.ps1
````

Modify $username and $password to the SFTP credentials provided for your district from Titan.

## Requirements
- CognosDownloader installed using te suggested install process
- Git
- Task Scheduler must run as the same user you used to save your eSchool/Cognos password.

## Scheduling Task
This must be done using the account you used to save your encrypted Cognos password.

* Open Task Scheduler
* New Basic Task
* Name it, Daily (or more), Set Time. (Please choose an offset on minutes like 8:23am)
* Action: Start a Program.
    * Program/script = "c:\Program Files\PowerShell\7\pwsh.exe"
    * Add arguments = "-ExecutionPolicy bypass -File c:\scripts\Titan\titan.ps1"
    * Start in = "c:\scripts\titan"
