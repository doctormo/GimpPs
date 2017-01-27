To help a fellow deviant, I've put together a download that anyone with Gimp 2.8 on Linux can use to make their copy of Gimp look more like Adobe Photoshop and make people more comfortable.

I've taken various bits of guides online and various tweaks.
All you have to do is download the file, unzip it.
Then in the file manager go to your home folder, show hidden files, delete or move your old .gimp-2.8 configuration folder out of the way, and replace with the new one.
Then load Gimp.

Please let me know if it works for you or if it fails.

## Getting Started

### Prerequisites

__Disclaimer:__ _GimpPs supports Windows, but works best on OS X and Linux._

* Gimp `2.8`
* `git` should be installed

### Basic Installation

GimpPs is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh)"
```

#### via wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh -O -)"
```

### Mac installation

	# exit gimp first
	cd $HOME/Library/Application\ Support/GIMP
	mv 2.8 2.8.backup
	git clone --depth=1 https://github.com/doctormo/GimpPs.git 2.8

### Windows installation

#### via powershell:

	# exit gimp first
	cd $Env:UserProfile
	mv .gimp-2.8 .gimp-2.8.backup
	git clone --depth=1 https://github.com/doctormo/GimpPs.git .gimp-2.8

#### via cmd:

	# exit gimp first
	cd %USERPROFILE%
	ren .gimp-2.8 .gimp-2.8.backup
	git clone --depth=1 https://github.com/doctormo/GimpPs.git .gimp-2.8
