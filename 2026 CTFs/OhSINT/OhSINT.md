# OhSINT TryHackMe Room Write Up 

## Overview
This is a write-up for the OhSINT TryHackMe Room - although I had previously completed this around November 2025, I had not documented it.
As it has been almost a year since completing the room. I will attempt to complete it again and document my steps thoroughly.

This small write up will contain:
- A record of my steps & My thought process
- Conclusion
Note: If you just want to follow my steps, you can skip the Main Thoughts Section and find the Steps Section

## Thoughts, Steps & Thought Process
With the file provided, I know it is always best to start with the metadata that could be left behind, I will use `exiftool` to find the metadata of the file:

<p align="center">
    <img src ="./images/exiftool-results.png" alt="An image showing the results from exiftool" width="500" height="500"/>
</p>

In the "copyright" section specifically we see the name "OWoodflint". Aliases online are frequently the same on other platforms, so we can use this to our advantage and search for it.
- Ignoring the AI Overview, we get the following results of interest:


<p align="center">
    Their Twitter pages:
    <img src ="./images/owoodflint-twitter.png" alt="An image showing OWoodflint's Twitter in the search results" width="1000" height="500"/>
    <br>
    <img src ="./images/owoodflint-twitter-page.png" alt="An image showing OWoodflint's Twitter page" width="500" height="500"/>
    <br>
    <br>
    Their Wordpress blog:
    <img src ="./images/owoodflint-wordpress.png" alt="An image showing OWoodflint's Wordpress in the search results" width="500" height="500"/>
    <br>
    <img src ="./images/owoodflint-wordpress-page.png" alt="An image showing OWoodflint's Wordpress page" width="500" height="500"/>
</p>



