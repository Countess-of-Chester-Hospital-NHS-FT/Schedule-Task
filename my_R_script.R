log_file <- "script_log_R.txt"
timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")

write(paste("Script ran at:", timestamp), file = log_file, append = TRUE)

cat("Script executed successfully!\n")