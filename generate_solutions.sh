#!/bin/bash

# Array of level objectives and commands
level_data=(
  # Level 00-01
  "Find the password stored in a file called readme|ls|List directory contents|cat readme|Display the password file"
  
  # Level 01-02
  "Find a password hidden in a file named -|cat ./-|Read a file named -"
  
  # Level 02-03
  "Find a password stored in a file with spaces in its name|cat \"spaces in this filename\"|Read a file with spaces"
  
  # Level 03-04
  "Find a hidden file in the directory|ls -a|List all files including hidden|cat .hidden|Read hidden file"
  
  # Level 04-05
  "Find the password in a human-readable file|file ./*|Identify file types|cat ./-file07|Read human-readable file"
  
  # Level 05-06
  "Find the password in a file with specific attributes|find . -size 1033c|Find 1033 byte file|cat ./maybehere07/.file2|Read the target file"
  
  # Level 06-07
  "Find the password owned by specific user|find / -user bandit7 -group bandit6 -size 33c 2>/dev/null|Search system files|cat /var/lib/dpkg/info/bandit7.password|Read target file"
  
  # Level 07-08
  "Find the password stored in data.txt next to 'millionth'|grep 'millionth' data.txt|Search for password marker"
  
  # Level 08-09
  "Find the password stored in the only unique line|sort data.txt | uniq -u|Find unique line"
  
  # Level 09-10
  "Find the password in human-readable string|strings data.txt | grep '^='|Extract readable strings"
  
  # Level 10-11
  "Find the password in base64 encoded file|base64 -d data.txt|Decode base64"
  
  # Level 11-12
  "Find the password in rot13 encoded file|tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt|Decode rot13"
  
  # Level 12-13
  "Find the password in hex dump|xxd -r data.txt > data|Reverse hex dump|file data|Check file type|mv data data.gz|gzip -d data.gz|bzip2 -d data|tar xvf data|tar xvf data5.bin|...|cat file|Final extraction"
  
  # Level 13-14
  "Use SSH private key to access next level|ssh -i sshkey.private bandit14@localhost|Login with private key"
  
  # Level 14-15
  "Submit password to local port|telnet localhost 30000|Connect to service|nc localhost 30000|Alternative connection"
  
  # Level 15-16
  "Submit password via SSL connection|openssl s_client -connect localhost:30001|SSL connection"
  
  # Level 16-17
  "Find server listening on specific port|nmap -p 31000-32000 localhost|Scan ports|openssl s_client -connect localhost:31790|Connect to service"
  
  # Level 17-18
  "Compare password files|diff passwords.old passwords.new|Find line difference"
  
  # Level 18-19
  "Login with modified environment|ssh -t bandit18@bandit.labs.overthewire.org \"bash --norc\"|Bypass .bashrc logout"
  
  # Level 19-20
  "Exploit setuid binary|./bandit20-do cat /etc/bandit_pass/bandit20|Use setuid privilege"
)

# Create directory if needed
mkdir -p bandit-solutions
cd bandit-solutions

for i in {0..19}; do
  next=$((i+1))
  printf -v current "%02d" $i
  printf -v next_padded "%02d" $next
  file="level${current}-${next_padded}.md"
  
  IFS='|' read -r objective cmd1 desc1 cmd2 desc2 <<< "${level_data[$i]}"
  
  cat > "$file" <<EOL
# Level ${current} → ${next_padded}

## Objective
${objective}

---

### Commands Used
- [ ] ${cmd1}  
  ${desc1}
EOL

  # Add second command if exists
  if [ -n "$cmd2" ]; then
    echo "- [ ] ${cmd2}  " >> "$file"
    echo "  ${desc2}" >> "$file"
  fi

  cat >> "$file" <<EOL

---

### Notes
- What did you learn?  
  [Key takeaways]
  
- Any new commands?  
  [New commands discovered]
  
- Anything tricky?  
  [Challenges encountered]
EOL
done

echo "Created all solution files in bandit-solutions/"
