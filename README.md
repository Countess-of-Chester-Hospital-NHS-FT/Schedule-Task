# Schedule Task

### About
This repo shows example code for scheduling a task to run a python script automatically (for example daily model runs for predictions).

Note: No data are shared in this repository

### Instructions (Laptop)

* Copy the contents of this repo to your Desktop.
* There are 2 sets of example files here (create_task_R.ps1, my_R_script.R and script_log_R.txt are the files you need for R, the other 3 are for python).
* create_task.ps1 is a powershell script which creates a 'run python script' task. This only needs to be run once to create the task. (Get-ScheduledTask shows all the tasks that have been created).
* You will need to edit the file paths in create_task.ps1 so they reference the correct paths for the python interpreter and for your files.
* Before scheduling a task for the first time run `Set-ExecutionPolicy RemoteSigned` in PowerShell.
* Run the ps script by opening powershell, using `cd` to move to the location with the ps script, then use command `.\create_task.ps1`
* my_script.py is a python script that just adds an entry to a log file (script_log.txt)
* Once you've created the task, you can check whether it ran ok using the log file.
* Delete a task by running `Unregister-ScheduledTask -TaskName "Run Test Python Script" -Confirm:$false`

### Instructions (Server)
* Run Powershell as administrator
* Run create_task_server.ps1 - runs the script whether the user is logged on or not.

### Output
The output of the .ps1 files is a scheduled task. The only output of the scripts is adding a timestamp to a log file.

### Contributing
Contributions and identification of issues are welcomed. Please either raise an Issue or leave a comment via Discussions.

