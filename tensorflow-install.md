##TensorFlow Install for iOS

### Instructions

**Clone the [tensorflow repository](https://github.com/tensorflow/tensorflow) into your root directory**
```bash
cd ~/
git clone https://github.com/tensorflow/tensorflow.git
``` 

_Note: To use this library in an iOS application, see related instructions in
the [iOS examples](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/ios_examples)in the tensorflow repository's sub-directory._


**Install XCode 7.3 or more recent.** If you have not already, you will need to
install the command-line tools using `xcode-select`:

```bash
xcode-select --install
```

_If this is a new install, you will need to run XCode once to agree to the
license before continuing._

(You will also need to have [Homebrew](http://brew.sh/) installed.)


**Then install [automake](https://en.wikipedia.org/wiki/Automake)/[libtool](https://en.wikipedia.org/wiki/GNU_Libtool):**

```bash
brew install automake
brew install libtool
```


**Also, download the tensorflow inception graph if you haven't already:**

```bash
mkdir -p ~/graphs
curl -o ~/graphs/inception.zip \
 https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip \
 && unzip ~/graphs/inception.zip -d ~/graphs/inception
```

_Note: To run the iOS example titled `camera` you will want the unzipped contents of `inception5h.zip` located in the directory `~/tensorflow/tensorflow/contrib/ios_examples/camera/data`._



**Building all at once**

To download and build all dependencies you can run these two commands consecutively 
from the root of your TensorFlow source folder:

```bash
tensorflow/contrib/makefile/download_dependencies.sh
```

```bash
tensorflow/contrib/makefile/build_all_ios.sh
```

This process will take around twenty minutes to an hour on a modern MacBook Pro.

When it completes, you will have a library for a single architecture and the
benchmark program. Although successfully compiling the benchmark program is a
sign of success, the program is not a complete iOS app.



### Troubleshooting the build:

If `build_all_ios.sh` script immediately fails with the with the following error
```
xcrun: xcode tensorflow error: SDK "iphoneos" cannot be located
xcrun: error: SDK "iphoneos" cannot be located
xcrun: error: unable to lookup item 'PlatformPath' in SDK 'iphoneos'
```
The solution is to reset xcode using the following command
```bash
sudo xcode-select --reset
```

If you are still having issues with the build, visit the following two links 
* [Building By Hand](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/makefile#building-by-hand)
* [iOS Troubleshooting Checklist](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/ios_examples#troubleshooting)


For examples of how to build applications for iOS devices using TensorFlow see [tensorflow/contrib/ios_examples](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/ios_examples) 

### For a detailed explanation on how to use the static library in a simple app visit [Creating Your Own App](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/ios_examples#creating-your-own-app)


## Building the Examples

 - You'll need Xcode 7.3 or later, with the command-line tools installed.

 - Follow the instructions at
   [tensorflow/contrib/makefile](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/makefile)
   under "iOS" to compile a static library containing the core TensorFlow code.

 - From the root of the Tensorflow folder, download
   [Inception v1](https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip),
   and extract the label and graph files into the data folders inside both the
   simple and camera examples:

```bash
mkdir -p ~/graphs
curl -o ~/graphs/inception5h.zip \
 https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip \
 && unzip ~/graphs/inception5h.zip -d ~/graphs/inception5h
cp ~/graphs/inception5h/* tensorflow/contrib/ios_examples/benchmark/data/
cp ~/graphs/inception5h/* tensorflow/contrib/ios_examples/camera/data/
cp ~/graphs/inception5h/* tensorflow/contrib/ios_examples/simple/data/
```


**For more information about using TensorFlow with iOS devices** please see official [TensorFlow iOS Examples](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/ios_examples)




