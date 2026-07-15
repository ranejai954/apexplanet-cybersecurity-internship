This essential Linux command line cheat sheet covers the core utilities needed to navigate systems, manage files, monitor performance, and configure permissions.
## Directory Navigation

* 
* pwd – Print working directory (shows your current location).
* ls – List files and folders in the current directory.
* ls -la – List all files, including hidden files, with detailed properties.
* cd /path – Change the current directory to a specified path.
* cd .. – Move up one level in the directory structure.
* cd ~ – Return to your user home directory. [2, 3, 4] 
* 

## File Management

* 
* touch filename – Create an empty file or update timestamps.
* mkdir foldername – Create a new directory.
* mkdir -p path/to/folder – Create nested parent and child directories at once.
* cp source dest – Copy a file from source to destination.
* cp -r source_dir dest_dir – Copy a directory and its contents recursively.
* mv oldname newname – Move or rename files or directories.
* rm filename – Delete a file.
* rm -rf foldername – Forcefully delete a directory and everything inside it.
* 

## Viewing & Searching Files

* 
* cat filename – Display the entire contents of a file on-screen.
* less filename – View a file page-by-page (press q to exit).
* head -n 10 filename – Display the first 10 lines of a file.
* tail -n 10 filename – Display the last 10 lines of a file.
* grep "pattern" filename – Search for specific text inside a file.
* find /path -name "filename" – Locate files by name within a specific directory. 
* 

## System & Resource Monitoring

* 
* uname -a – Display comprehensive system and kernel information.
* uptime – Show how long the system has been running and current load averages.
* df -h – Show disk space usage in a human-readable format.
* du -sh folder – Display the total storage size of a specific folder.
* free -h – Display used and available system RAM memory.
* top – Monitor running processes and resource usage in real time.
* htop – Interactive, user-friendly process viewer (requires installation).
* kill PID – Forcefully terminate a process using its Process ID

*

## File Permissions

* 
* chmod 755 filename – Grant read, write, and execute permissions to the owner, and read/execute to others.
* chmod +x script.sh – Make a script file executable.
* chown user:group filename – Change the owner and group ownership of a file. 
* 

## Network Utilities

* 
* ping host – Send echo requests to test the network connection to a host.
* curl URL – Download data or pull web content directly from a URL.
* wget URL – Download files from the internet straight to your terminal.
* ssh user@host – Connect to a remote machine securely over SSH. 
* 

## Useful Shortcuts

* 
* Tab – Autocompletes commands, directories, and file names.
* Ctrl + C – Immediately kills or cancels the currently running command.
* Ctrl + L – Clears the terminal screen (same as typing clear).
* history – View a numbered list of previously executed commands. 
* 

