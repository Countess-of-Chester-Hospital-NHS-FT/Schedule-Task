# Schedule Task

### About
This repo shows example code for scheduling a task to run a python script automatically (for example daily model runs for predictions).

Note: No data are shared in this repository

### Instructions

* Copy the contents of this repo to your Desktop.
* create_task.ps1 is a powershell script which creates a 'run python script' task. This only needs to be run once to create the task. (Get-ScheduledTask shows all the tasks that have been created).
* You will need to edit the file paths in create_task.ps1 so they reference the correct paths for the python interpreter and for your files.
* my_script.py is a python script that just adds an entry to a log file (script_log.txt)
* Once you've created the task, you can check whether it ran ok using the log file.

### Contributing
Contributions and identification of issues are welcomed. Please either raise an Issue or leave a comment via Discussions.

