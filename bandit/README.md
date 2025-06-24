# OverTheWire: Bandit Solutions (Levels 00–20)

Solutions to the Bandit wargame from OverTheWire. Passwords are omitted in accordance with their usage guidelines.

---

### Level 00 → 01  
🌟 **Objective**  
Find the password stored in a file called `readme` in the home directory.

🧪 **Commands Used**  
`ls`  
`cat readme`

🔐 **Password**  
✅ Password retrieved successfully — not shown for OverTheWire compliance.

🧐 **Notes**  
What did you learn?  
How to list files and read file contents using `ls` and `cat`.

Any new command/tool?  
`cat` to display file contents.

Anything tricky?  
Very straightforward.

---

### Level 01 → 02  
🌟 **Objective**  
Find a file named `-` and read its contents.

🧪 **Commands Used**  
`ls`  
`cat ./-`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Using `./` lets you access a file that would otherwise be confused for a command option.

---

### Level 02 → 03  
🌟 **Objective**  
Find and read a file with spaces in its name.

🧪 **Commands Used**  
`ls`  
`cat "spaces in this filename"`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Use quotes to handle filenames with spaces.

---

### Level 03 → 04  
🌟 **Objective**  
Find a hidden file in the `inhere` directory.

🧪 **Commands Used**  
`cd inhere`  
`ls -a`  
`cat .hidden`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
The `-a` flag shows hidden files (those starting with a dot).

---

### Level 04 → 05  
🌟 **Objective**  
Identify and read the only human-readable file among several binary files.

🧪 **Commands Used**  
`file ./-*`  
`cat [readable-file]`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
The `file` command helps identify file types.

---

### Level 05 → 06  
🌟 **Objective**  
Find a 1033-byte file that is not executable.

🧪 **Commands Used**  
`find . -type f -size 1033c ! -executable`  
`cat ./[filename]`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Use `find` with size and permissions filters.

---

### Level 06 → 07  
🌟 **Objective**  
Find a file with specific user and group ownership and size.

🧪 **Commands Used**  
`find / -user bandit6 -group bandit6 -size 33c 2>/dev/null`  
`cat [path]`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Redirect `find` errors to `/dev/null` to avoid permission clutter.

---

### Level 07 → 08  
🌟 **Objective**  
Find the line containing the word `millionth`.

🧪 **Commands Used**  
`grep millionth data.txt`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
`grep` is great for searching file contents.

---

### Level 08 → 09  
🌟 **Objective**  
Find the unique entry in a file with repeated lines.

🧪 **Commands Used**  
`sort data.txt | uniq -u`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
`uniq -u` shows only lines that appear once.

---

### Level 09 → 10  
🌟 **Objective**  
Find a human-readable password hidden in a binary file.

🧪 **Commands Used**  
`strings data.txt | grep ===`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
`strings` extracts readable text from binaries.

---

### Level 10 → 11  
🌟 **Objective**  
Decode a base64 encoded password.

🧪 **Commands Used**  
`base64 -d data.txt`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
The `-d` flag decodes base64 data.

---

### Level 11 → 12  
🌟 **Objective**  
Decrypt a ROT13 encoded password.

🧪 **Commands Used**  
`cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
`tr` can do basic letter substitutions like ROT13.

---

### Level 12 → 13  
🌟 **Objective**  
Extract a password from a hexdump that has been compressed several times.

🧪 **Commands Used**  
`xxd -r`  
`file`  
`gzip`, `bzip2`, `tar`, `zcat`, `cat`

🔐 **Password**  
✅ Retrieved after multiple decompression steps.

🧐 **Notes**  
Recognizing file types helps determine which tool to use.

---

### Level 13 → 14  
🌟 **Objective**  
Use a private SSH key to login to the next level.

🧪 **Commands Used**  
`ssh -i sshkey.private bandit14@localhost`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Permissions for the key must be set properly: `chmod 600`.

---

### Level 14 → 15  
🌟 **Objective**  
Connect to a port using `telnet` to retrieve the password.

🧪 **Commands Used**  
`telnet localhost 30000`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Simple network interaction via `telnet`.

---

### Level 15 → 16  
🌟 **Objective**  
Use SSL to connect and retrieve a password from a port.

🧪 **Commands Used**  
`openssl s_client -connect localhost:30001`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Look for prompts in the SSL response.

---

### Level 16 → 17  
🌟 **Objective**  
Find the correct SSL-enabled port and extract the password.

🧪 **Commands Used**  
`nmap -p 31000-32000 localhost`  
`openssl s_client`  
`cat`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
`nmap` helps scan open ports; look for service banners.

---

### Level 17 → 18  
🌟 **Objective**  
Compare two files to find the password change.

🧪 **Commands Used**  
`diff passwords.old passwords.new`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
`diff` highlights the differences between two files.

---

### Level 18 → 19  
🌟 **Objective**  
Use a script to log in as the next level and read the password.

🧪 **Commands Used**  
`ssh bandit18@localhost "cat /etc/bandit_pass/bandit19"`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
SSH can run remote commands directly with quotes.

---

### Level 19 → 20  
🌟 **Objective**  
Execute a program with another user's permissions.

🧪 **Commands Used**  
`./bandit20-do cat /etc/bandit_pass/bandit20`

🔐 **Password**  
✅ Retrieved successfully.

🧐 **Notes**  
Use `./program command` when you have limited execution access.

---
