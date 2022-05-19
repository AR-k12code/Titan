# Titan

These scripts come without warranty of any kind. Use them at your own risk. I assume no liability for the accuracy, correctness, completeness, or usefulness of any information provided by this site nor for any sort of damages using these scripts may cause.

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