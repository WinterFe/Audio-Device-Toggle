
# Audio Device Toggle

Toggle between 2 different default audio devices (Input/Output) with the click of a button. This program is for VR users who are tired of swapping their Windows audio devices every time they launch VR!

--- 




## Installation

*Note: Latest PowerShell is required, get it here: https://www.microsoft.com/store/productId/9MZ1SNWT0N5D*

View the [Releases](https://github.com/WinterFe/Audio-Device-Toggle/releases) page to download ZIP.
- Unzip program in whatever folder you want.
- Open `config.json` and edit it to your system. Example config below
- Run the install file
- You can now open the `VRCAudioToggle` shortcut and the program will work :)


```JSON
{
    "VR": {
        "Output": "VoiceMeeter Input (VB-Audio VoiceMeeter VAIO)",
        "Input": "VoiceMeeter Output (VB-Audio VoiceMeeter VAIO)"
    },
    "Desktop": {
        "Output": "System (TC-Helicon GoXLR)",
        "Input": "Chat Mic (TC-Helicon GoXLR)"
    }
}
```
## FAQ

#### What is Output in the config?

Output is the audio device related to listening, E.G., your headphones.

#### What is Input in the config?

Input is the audio device related to speaking, E.G., your mic.


## Support

For support, email winter@lunardev.group or add me on Discord: `winterfe`.


## Acknowledgements

 - [Logo inspired by VoiceMeeter](https://vb-audio.com/Voicemeeter/)

## Authors

- [@WinterFe](https://github.com/WinterFe)


## License

[MIT](https://choosealicense.com/licenses/mit/)

