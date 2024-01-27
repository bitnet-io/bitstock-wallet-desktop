<p align="center">
    <a href="https://atomicdex.io" alt="Komodo Wallet">
	<img width="420" alt="komodo-wallet-logo_dark-theme" src="https://user-images.githubusercontent.com/24797699/252409662-eb03b0b1-5f6e-4494-9267-132eba827718.png">
    </a>
</p>

<p align="center">
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/graphs/contributors" alt="Contributors">
        <img src="https://img.shields.io/github/contributors/komodoplatform/komodo-wallet-desktop" />
    </a>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/releases">
        <img src="https://img.shields.io/github/downloads/komodoplatform/komodo-wallet-desktop/total" alt="downloads">
    </a>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/">
        <img src="https://img.shields.io/github/last-commit/komodoplatform/komodo-wallet-desktop" alt="last commit">
    </a>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/komodoplatform/komodo-wallet-desktop" />
    </a>
	<br/>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/issues">
        <img src="https://img.shields.io/github/issues-raw/komodoplatform/komodo-wallet-desktop" alt="issues">
    </a>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/issues?q=is%3Aissue+is%3Aclosed">
        <img src="https://img.shields.io/github/issues-closed-raw/komodoplatform/komodo-wallet-desktop" alt="issues closed">
    </a>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/pulls">
        <img src="https://img.shields.io/github/issues-pr/komodoplatform/komodo-wallet-desktop" alt="pulls">
    </a>
    <a href="https://github.com/komodoplatform/komodo-wallet-desktop/pulls?q=is%3Apr+is%3Aclosed">
        <img src="https://img.shields.io/github/issues-pr-closed/komodoplatform/komodo-wallet-desktop" alt="pulls closed">
    </a>
	<br/>
    <a href="https://github.com/KomodoPlatform/komodo-wallet-desktop/actions/workflows/komodo-wallet-desktop-ci.yml">
        <img src="https://github.com/KomodoPlatform/komodo-wallet-desktop/actions/workflows/komodo-wallet-desktop-ci.yml/badge.svg?branch=master" alt="build status">
    </a>
    <a href="https://github.com/KomodoPlatform/komodo-wallet-desktop/releases">
        <img src="https://img.shields.io/github/v/release/komodoplatform/komodo-wallet-desktop" alt="release version">
    </a>
    <a href="https://discord.gg/3rzDPAr">
        <img src="https://img.shields.io/discord/302123079818149888?logo=discord" alt="chat on Discord">
    </a>
    <a href="https://twitter.com/KomodoPlatform">
        <img src="https://img.shields.io/twitter/follow/komodoplatform?style=social&logo=twitter"
            alt="follow on Twitter">
    </a>
</p>


## What is Komodo Wallet?

Komodo Wallet is a secure wallet and non-custodial decentralized exchange rolled into one application. Store your coins,
trade peer-to-peer with minimal fees and never give up control over your digital assets.

Komodo Wallet has been tested on the following platforms:

- Windows 10
- Linux (Ubuntu 18.04+)
- macOS (10.14 - 11.0)


## Get Started

You can [download](https://github.com/KomodoPlatform/komodo-wallet-desktop/releases) the pre-built <b>beta</b> binaries on
our [GitHub release page](https://github.com/KomodoPlatform/komodo-wallet-desktop/releases).

Build instructions can be found [here](https://github.com/KomodoPlatform/komodo-wallet-desktop/wiki/Build-Instructions)

Please join our [Discord Server](https://komodoplatform.com/discord) for support, discussions and general UI/UX
feedback.


# Building Bitstock for Linux + macOS + Windows

* https://github.com/bitnet-io/bitstock-wallet-desktop/blob/main/doc-readme/Build-Instructions.md

# Building Bitstock  Desktop on Linux (Feodra or Ubuntu)


### Prerequisites

- Clang C++ 17 compiler (clang-12 minimum)
- [CMake](https://cmake.org/install/) 3.18 minimum


### Clone Bitstock  repository (with submodules)

`git clone --recurse-submodules https://github.com/bitnet-io/bitstock-wallet-desktop`


### Install Qt

```bash
# Could also be pip3 depending of your python installation
python3 -m pip install --upgrade pip
pip install aqtinstall==3.1.1
python3 -m aqt install-qt linux desktop 5.15.2 -O $HOME/Qt -b https://qt-mirror.dannhauer.de/ -m qtcharts debug_info qtwebengine
```

Add the following environment variables to your `~/.bashrc` or `~/.zshrc` profiles:
 * `QT_INSTALL_CMAKE_PATH` equal to the CMake QT path
 * `QT_ROOT` equal to the QT root installation folder

e.g.:
```bash
export QT_INSTALL_CMAKE_PATH=~/Qt/5.15.2/gcc_64/lib/cmake
export QT_ROOT=~/Qt/5.15.2
```

Make sure Qt binaries are on the PATH. E.g.

```bash
export PATH=$PATH:/home/username/Qt/version/arch/bin
```

### Install Linux dependencies (aptitude)

```bash
sudo apt-get install build-essential \
                    libgl1-mesa-dev \
                    ninja-build \
                    curl \
                    wget \
                    zstd \
                    software-properties-common \
                    lsb-release \
                    libpulse-dev \
                    libtool \
                    autoconf \
                    unzip \
                    libssl-dev \
                    libxkbcommon-x11-0 \
                    libxcb-icccm4 \
                    libxcb-image0 \
                    libxcb1-dev \
                    libxcb-keysyms1-dev \
                    libxcb-render-util0-dev \
                    libxcb-xinerama0 \
                    libgstreamer-plugins-base1.0-dev \
                    git -y

# get llvm
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 12

# set clang version
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-12 777
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 777
sudo apt-get update
# if you want to use libclang
#sudo apt-get install libc++abi-12-dev libc++-12-dev -y

# Add the following environment variables to your `~/.bashrc` or `~/.zshrc` profiles:

#if you want to use libclang
#export CXXFLAGS=-stdlib=libc++
#export LDFLAGS=-stdlib=libc++
export CXX=clang++-12
export CC=clang-12
```

### Install Linux dependencies (rpm)

```bash
sudo dnf update
sudo dnf groupinstall "Development Tools" "Development Libraries"
sudo dnf install  wget \
                  curl \
                  cmake \
                  perl \
                  calng12-devel \
                  ninja-build \
                  zstd \
                  mesa-libGL-devel \
                  redhat-lsb-core \
                  libtool \
                  autoconf \
                  zip \
                  unzip \
                  openssl \
                  openssl-devel \
                  libxkbcommon-x11 \
                  libxcb-* \
                  gstreamer1-plugins-base-devel perl-FindBin perl perl-IPC-Cmd


# Fresh versions of RedHat (9+) and Fedora (34+) come with clang15 and llvm15, no extra packages or configuration is required
```


### Install Libwally

```bash

wget https://github.com/bitnet-io/bitstock-wallet-desktop/releases/download/libwallet-linux/libwally-core.tar.gz
tar -xvf libwally-core
cd libwally-core

# Build

./tools/autogen.sh
./configure --disable-shared  # configure requires access to python binary on the PATH
# either pass PYTHON_VERSION=3.X to the build command or link your python3.X installation to /usr/bin/python
sudo make -j2 install
```


### Bootstrap VCPKG modules

Install vcpkg from within the `ci_tools_atomic_dex` folder:

```bash
cd ci_tools_atomic_dex/vcpkg-repo
./bootstrap-vcpkg.sh
./vcpkg install
```


### Build BitStock-Desktop (portable)

In your shell command prompt (Powershell/Zsh/Bash), from within the `root` folder (e.g. ~/BitStock-Desktop), type:

```bash
mkdir build
cd build              # create the 'build' folder if it doesn't exist
cmake -DCMAKE_BUILD_TYPE=Release ../    # add -GNinja if you want to use the ninja build system.
cmake --build . --config Release --target bitstock-wallet

```


### Bundle BitStock-Desktop (installer)


```
mkdir build
cd build              # create the 'build' folder if it doesn't exist
cmake -DCMAKE_BUILD_TYPE=Release -GNinja ../
cmake --build . --config Release --target bitstock-wallet
ninja install
```













## Useful links

- :book: [Komodo Wallet Documentation](https://developers.komodoplatform.com/basic-docs/atomicdex/atomicdex-tutorials/introduction-to-atomicdex.html)
- :link: [Komodo Wallet Website](https://atomicdex.io/)
- :speech_balloon: [Komodo Wallet Discord](https://discord.gg/tvp96Gf)
- :hammer_and_wrench: [Komodo Wallet Development Boards](https://github.com/KomodoPlatform/komodo-wallet-desktop/projects)
- :notebook_with_decorative_cover: [Komodo Wallet Wiki](https://github.com/KomodoPlatform/komodo-wallet-desktop/wiki/)


## Komodo Wallet mobile

Check out Komodo Wallet mobile, available for [Android and iOS](https://atomicdex.io)


## Self-Hosted Dependencies

| Dependencies  | Version    | Description                                                                                                                                     | Categories          |
|---------------|------------|-------------------------------------------------------------------------------------------------------------------------------------------------|---------------------|
| boost         | 1.78       | Boost provides free peer-reviewed portable C++ source libraries.                                                                                | General Programming |
| doctest       | 2.3.8      | The fastest feature-rich C++11/14/17/20 single-header testing framework                                                                         | Testing             |
| fmt           | 7.1.0      | A modern formatting library                                                                                                                     | Formatting          |
| nlohmann_json | 3.9.1      | JSON for Modern C++                                                                                                                             | Parsing             |
| range-v3      | 0.11.0     | Range library for C++14/17/20, basis for C++20's std::ranges                                                                                    | Algorithm           |
| date          | 2019-11-08 | A date and time library based on the C++11/14/17 <chrono> header                                                                                | Timezone/Calendar   |
| spdlog        | 1.8.5      | Fast C++ logging library.                                                                                                                       | Logging             |
| openssl       | 1.1.1h     | TLS/SSL and crypto library                                                                                                                      | Network/Crypto      |
| entt          | 3.5.1      | Gaming meets modern C++ - a fast and reliable entity component system (ECS) and much more                                                       | Architecture        |
| cpprestsdk    | 2.10.15-1  | The C++ REST SDK is a Microsoft project for cloud-based client-server  communication in native code using a modern asynchronous C++ API design. | HTTP                |
| taskflow      | 2.2.0      | Parallel and Heterogeneous Task Programming in Modern C++                                                                                       | Threading           |
| qt            | 5.15.2     | Qt is a cross-platform application development framework for desktop, embedded and mobile.                                                      | GUI                 |





## License

For details please refer to our [license](https://github.com/KomodoPlatform/komodo-wallet-desktop/blob/master/LICENSE).

This is experimental alpha software - use at your own risk!

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
