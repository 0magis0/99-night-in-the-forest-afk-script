# Roblox AFK Scrip

This project provides an AutoHotkey script designed to help users stay active (AFK) in Roblox games, preventing them from being kicked for inactivity. The script automates basic actions such as pressing the spacebar and clicking the mouse.

## Prerequisites

To use this script, you must have [AutoHotkey](https://www.autohotkey.com/) installed on your operating system. AutoHotkey is a free and open-source program for automating tasks on Windows.

## Features

The script automatically performs the following actions:

1.  **Random Spacebar Presses**:
    *   The spacebar is pressed randomly at intervals ranging from 5 seconds to 1 minute. This simulates player movement and prevents detection of inactivity.

2.  **Pressing Key 7 and Mouse Click (Every 4 Minutes)**:
    *   Key `7` is pressed, followed by a mouse click, every 4 minutes. This can be used to activate a specific in-game ability or interact with the user interface.

3.  **Additional Sequence (Every 10 Minutes)**:
    *   A sequence of actions is performed every 10 minutes to ensure continuous activity:
        *   Press key `7`.
        *   Wait 0.5 seconds.
        *   Mouse click.
        *   Wait 2 seconds.
        *   Press key `7` again.
        *   Wait 0.5 seconds.
        *   Mouse click.

## How the Script Works (Technical Explanation)

The script is written in AutoHotkey language and uses the following functions:

*   `#Persistent`: Makes the script run continuously in the background until manually closed.
*   `SetTimer`: Used to schedule function execution at specified intervals:
    *   `RandomSpacePress`: Initially called every second, then the wait time is randomly rescheduled (5, 10, 20, 30, 60 seconds) before pressing the spacebar.
    *   `PressSevenWithClick`: Called every 240000 milliseconds (4 minutes).
    *   `AdditionalSequence`: Called every 600000 milliseconds (10 minutes).
*   `Random, randomInterval, 1, 5`: Generates a random number between 1 and 5 to determine the wait period for spacebar presses.
*   `Sleep, %waitTime%`: Pauses script execution for the specified duration in milliseconds.
*   `Send, {Space}` and `Send, {7}`: Simulates pressing the spacebar and key 7, respectively.
*   `Click`: Simulates a left mouse click at the current cursor position.
*   `F12::ExitApp`: Provides a hotkey (`F12`) to immediately close the script.

## Usage

1.  Download and install [AutoHotkey](https://www.autohotkey.com/).
2.  Download the `script.ahk` file from this repository.
3.  Double-click the `script.ahk` file to run it. The AutoHotkey icon will appear in the system tray.
4.  To stop the script, press the `F12` key.

## Disclaimer

Please use this script responsibly and at your own risk. Some games may conflict with the use of automation software, which could lead to your account being banned. The developer of this script assumes no responsibility for any consequences that may arise from its use.

