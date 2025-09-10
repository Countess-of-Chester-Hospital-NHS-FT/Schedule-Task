# my_script.py
import datetime

with open("script_log.txt", "a") as f:
    f.write(f"Script ran at: {datetime.datetime.now()}\n")

print("Script executed successfully!")