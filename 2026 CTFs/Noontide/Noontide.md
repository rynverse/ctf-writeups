# 2026 Hackathon - Noontide Write-up

## Overview
This is a write-up for a Hackathon I attended in person in March 2026. This small write up will contain:
- A record of my steps & My thought process
- Conclusion
Note: If you just want to follow my steps, you can skip the Main Thoughts Section and find the Steps Section

## Thoughts, Steps & Thought Process
Following the [Advent of Cyber](/2025%20CTFs/Advent%20of%20Cyber/AoC_README.md) event, this was my first Hackathon of 2026. 
Completing this hackathon required me to setup:
- VirtualBox
- A vulnerable __Metasploitable__ Machine, networked with the Kali Machine
- An attacker __Kali Linux__ Machine, networked with the Metasploitable Machine

Metasploitable machines are specifically made to test exploits, and should **never** be exposed to the internet - but this does mean I may be able to look for exploits I can use.

Although we know both machines are on the same network, we want to figure out the IP address of the Metasploitable machine using the Kali Linux Machine.

I need to do this by using `ifconfig` to find the network I am on (standard procedure, even though we know it- it's good practice to never assume) and use `nmap`.

1. Ran `ifconfig` and observed the `eth0` inet address, because this is on a Virtual Machine, it should only show `127.0.0.1` (itself) and the network IP.

Network IP range is `10.0.2.0/24` (Kali is `10.0.2.5`)

2. Ran the command `nmap -sP 10.0.2.0/24` to scan for connected devices to the network.

## Steps
1. Ran `ifconfig` and observed the `eth0` inet address, because this is on a Virtual Machine, it should only show `127.0.0.1` (itself) and the network IP.
2. Ran the command `nmap -sP 10.0.2.0/24` to scan for connected devices to the network.










