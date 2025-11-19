# Define variables
$TaskName = "Run Case Duration Prediction Script"
$Description = "Schedules the case duration script to run twice daily."
$PythonPath = "C:\Users\YourServerUserName\.conda\envs\case-duration\python.exe" # Replace with your actual Python path
$ScriptPath = "C:\Users\YourServerUserName\Desktop\Case-Duration\predict.py" # Replace with your actual script path
$WorkingDirectory = "C:\Users\YourServerUserName\Desktop\Case-Duration" # The directory where your script is located

# 1. Create an Action: What to run
$Action = New-ScheduledTaskAction -Execute $PythonPath -Argument "`"$ScriptPath`"" -WorkingDirectory $WorkingDirectory

# 2. Create a Trigger: When to run (e.g., daily at 10:00 AM)
#$Trigger = New-ScheduledTaskTrigger -Daily -At "01:06 PM"
$Trigger1 = New-ScheduledTaskTrigger -Daily -At "10:29 AM"
$Trigger2 = New-ScheduledTaskTrigger -Daily -At "11:29 AM"
$Triggers = @($Trigger1, $Trigger2)


# 3. Create Task Settings: Additional configurations
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable:$false

$Principal = New-ScheduledTaskPrincipal -UserId $env:UserName -LogonType S4U

# 4. Register the Scheduled Task
Register-ScheduledTask -TaskName $TaskName -Description $Description -Action $Action -Trigger $Triggers -Settings $Settings -Principal $Principal -Force
