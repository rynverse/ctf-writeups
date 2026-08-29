#!/bin/bash

# Whoami?

echo "Who am I?:"
Whoami
echo "###############"

# Complete step 1
echo "Opening README.txt..."
ls 
cat README.txt
echo "###############"

# Complete step 2
echo "Finding dotfile guides.txt"
cd Guides
ls -al
cat .guides.txt
echo "###############"

# Complete step 3
echo "Finding all failed password attempts..."
cd /var/log && grep "Failed password" auth.log
echo "###############"

# Complete step 4
echo "Finding for any leftover signs..."
cd .. && find /home/socmas -name *egg*
echo "###############"

# Complete step 5
echo "Analyse the found bash file..."
cat /home/socmas/2025/eggstrike.sh
echo "###############"

# Complete step 6
echo "Extracting .bash_history..."
sudo cd /root
cat .bash_history
echo "###############"
 
echo "Script Complete."
