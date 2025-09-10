# Define variables
$TaskName = "Run Test R Script"
$Description = "Schedules an R script to run daily."
$RPath = "C:\Program Files\R\R-4.5.1\bin\Rscript.exe" # Replace with your actual Python path
$ScriptPath = "C:\Users\User Name\Desktop\Schedule-Task\my_R_script.R" # Replace with your actual script path
$WorkingDirectory = "C:\Users\User Name\Desktop\Schedule-Task" # The directory where your script is located

# 1. Create an Action: What to run
$Action = New-ScheduledTaskAction -Execute $RPath -Argument "`"$ScriptPath`"" -WorkingDirectory $WorkingDirectory

# 2. Create a Trigger: When to run (e.g., daily at 10:00 AM)
#$Trigger = New-ScheduledTaskTrigger -Daily -At "01:06 PM"
$Trigger1 = New-ScheduledTaskTrigger -Daily -At "02:20 PM"
$Trigger2 = New-ScheduledTaskTrigger -Daily -At "02:21 PM"
$Triggers = @($Trigger1, $Trigger2)

# You can also use other triggers, for example:
# $Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(5) # Run once, 5 minutes from now
# $Trigger = New-ScheduledTaskTrigger -AtLogon # Run at user logon
# $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday,Wednesday,Friday -At "09:00 AM"

# 3. Create Task Settings: Additional configurations
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable:$false

# 4. Register the Scheduled Task
# For running under system
#Register-ScheduledTask -TaskName $TaskName -Description $Description -Action $Action -Trigger $Trigger -Settings $Settings -User "System" -Force
# For running under the current user:
Register-ScheduledTask -TaskName $TaskName -Description $Description -Action $Action -Trigger $Triggers -Settings $Settings -User $env:UserName -Force

Write-Host "Scheduled task '$TaskName' created successfully!"