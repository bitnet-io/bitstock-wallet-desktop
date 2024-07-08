#!/bin/sh


#                   

dnf update
dnf groupinstall "Development Tools" "Development Libraries" -y
dnf install  wget \
                 curl \
                  cmake \
                  perl \
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
                  gstreamer1-plugins-base-devel -y
		  
git clone https://github.com/KomodoPlatform/komodo-wallet-desktop && cd komodo-wallet-desktop &&  git submodule init &&  git submodule sync --recursive &&  git submodule update --init --recursive





#debian 10+11
python3 -m pip install --upgrade pip
pip install aqtinstall==3.1.1
python3 -m aqt install-qt linux desktop 5.15.2 -O $HOME/Qt -b https://qt-mirror.dannhauer.de/ -m qtcharts debug_info qtwebengine








wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 13
#sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-13 777
#sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-13 777
#sudo apt-get update
#apt install clang-tidy -y									

									# if you want to use libclang
									#sudo apt-get install libc++abi-12-dev libc++-12-dev -y
									# Add the following environment variables to your `~/.bashrc` or `~/.zshrc` profiles:
									#if you want to use libclang
									#export CXXFLAGS=-stdlib=libc++
									#export LDFLAGS=-stdlib=libc++

export CXXFLAGS="-Wnounused-parameter -Wnodeprecated-declarations -w"
export CXX=clang++-13
export CC=clang-13



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
cd vcpkg-repo
./bootstrap-vcpkg.sh

#patch ninja to higher version
wget https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip
unzip ninja-linux.zip 
cp -rf ninja /usr/bin/


./vcpkg install
cd ../..




mkdir build
cd build               

#to list possible makefile targets
#cmake --build . --target help

#debian10
#patch cmake to 3.30 for 3.18 and higher
   
wget https://github.com/Kitware/CMake/releases/download/v3.30.0-rc4/cmake-3.30.0-rc4-linux-x86_64.tar.gz
tar -xvf cmake-3.30.0-rc4-linux-x86_64.tar.gz 
cp -rf cmake-3.30.0-rc4-linux-x86_64/* /usr/ 
mkdir build && cd build

export QT_INSTALL_CMAKE_PATH=~/Qt/5.15.2/gcc_64/lib/cmake
export QT_ROOT=~/Qt/5.15.2
export PATH=$PATH:/root/Qt/5.15.2/gcc_64/bin

sleep 5s
echo 'enter dir and build'
echo ''
echo 'cd /opt/komodo-desktop-wallet/komodo-wallet-desktop && make build && cd build'
echo ''
echo ' cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ../  '
echo ''
echo  'cmake --build . --config Release --target komodo-wallet'
echo ''
echo 'exit from docker with exit and  cd  /root/komodo-wallet-desktop/komodo-wallet-desktop/build'
echo ''
echo 'binary should be in bin/AntaraAtomicDexAppDir/usr/bin/komodo-wallet should copy to the host with cp -rf ./bin/AntaraAtomicDexAppDir/usr/bin/komodo-wallet /usr/bin/'
echo ''
echo 'building for an appimage must be done on the host or with PID1 in docker running'
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ../ 
echo 'make -j24'
echo 'make install DESTDIR=AppDir'
echo 'wget https://github.com/linuxdeploy/linuxdeploy/releases/download/1-alpha-20240109-1/linuxdeploy-x86_64.AppImage'
echo 'chmod +x linuxdeploy-x86_64.AppImage'
echo './linuxdeploy-x86_64.AppImage --appdir AppDir/ --output appimage --icon-filename --desktop-file myprogram.desktop --icon-file icon'


