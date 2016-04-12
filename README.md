run-commands
==

Connor's run commands setting (*.rc file)

## setup a new mac

### set hostname

`sudo hostname -s NewHostName`

### set bash_profile

`cp ~/git/run-commands/.bash_profile ~/`

### set bluetooth better quality

```
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 48
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 40
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 58
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 58
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 48
```

## file detail:

* .vimrc
  * color syntax

* .bash_profile
  * boot strap for mac terminal, must include this when copying `.bashrc`

* .bashrc
  * PS1 color prompt

* .screenrc
  * scroll buffer
  * status line

