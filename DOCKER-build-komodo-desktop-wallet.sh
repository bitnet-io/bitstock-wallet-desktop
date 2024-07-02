echo 
'docker run -it --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet debian:11
docker exec -it <docker_hash_here> bash'
sleep 1s
echo 'then run these commands'
sleep 2s

apt-get update -y
apt install sudo
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

apt install python3-pip python cmake zip -y

apt install libnss3 libxcomposite1 libxrandr2 libxcursor1 libxi6 libxtst6 libasound2 -y

apt install build-essential libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev -y

git clone https://github.com/KomodoPlatform/komodo-wallet-desktop

cd komodo-wallet-desktop
 git submodule init
 git submodule sync --recursive
 git submodule update --init --recursive
cd atomic_defi_design/imports/bignumberjs/bignumber.js
wget https://raw.githubusercontent.com/MikeMcl/bignumber.js/master/bignumber.js
cd ../../../..

python3 -m pip install --upgrade pip
pip install aqtinstall==3.1.1
python3 -m aqt install-qt linux desktop 5.15.2 -O $HOME/Qt -b https://qt-mirror.dannhauer.de/ -m qtcharts debug_info qtwebengine


export QT_INSTALL_CMAKE_PATH=~/Qt/5.15.2/gcc_64/lib/cmake
export QT_ROOT=~/Qt/5.15.2

export PATH=$PATH:/root/Qt/5.15.2/gcc_64/bin
export QMAKE_CXXFLAGS="-fno-sized-deallocation -w"


wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 12


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




git clone https://github.com/KomodoPlatform/libwally-core.git
cd libwally-core
 git submodule init
 git submodule sync --recursive
 git submodule update --init --recursive
./tools/autogen.sh
./configure --disable-shared --prefix=/usr
															#./configure --disable-shared  # configure requires access to python binary on the PATH
															# either pass PYTHON_VERSION=3.X to the build command or link your python3.X installation to /usr/bin/python
sudo make -j24 install
cd ../


cd ci_tools_atomic_dex

wget https://github.com/bitnet-io/bitstock-wallet-desktop/releases/download/vcpkg-repo/vcpkg-repo.tar.gz
tar -xvf vcpkg-repo.tar.gz
cd vcpkg-repo
./bootstrap-vcpkg.sh
./vcpkg install
cd ..




cd ..
mkdir build
cd build  
make -j24 clean # create the 'build' folder if it doesn't exist
cmake -DCMAKE_BUILD_TYPE=Release ../ 
cmake --build . --target help

cmake --build . --config Release --target komodo-wallet

#binary should be in
bin/AntaraAtomicDexAppDir/usr/bin/komodo-wallet
