#docker run -it --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet debian:12
#docker exec -it <docker_hash_here> bash



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
                    git libnss3 libxcomposite1 libxrandr2 libxcursor1 libxi6 libxtst6 libasound2 librange-v3-dev \
		    python3-pip python-is-python3 2to3 cmake zip build-essential libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev \
      		    aptitude apt-file -y

git clone https://github.com/KomodoPlatform/komodo-wallet-desktop && cd komodo-wallet-desktop &&  git submodule init &&  git submodule sync --recursive &&  git submodule update --init --recursive




python3 -m pip install --upgrade pip

#debian 10+11
#pip install aqtinstall==3.1.1 

#debian 12
pip install aqtinstall==3.1.1 --break-system-packages

										

python3 -m aqt install-qt linux desktop 5.15.2 -O $HOME/Qt -b https://qt-mirror.dannhauer.de/ -m qtcharts debug_info qtwebengine


export QT_INSTALL_CMAKE_PATH=~/Qt/5.15.2/gcc_64/lib/cmake
export QT_ROOT=~/Qt/5.15.2
export PATH=$PATH:/root/Qt/5.15.2/gcc_64/bin





# debian11
#wget https://apt.llvm.org/llvm.sh
#chmod +x llvm.sh
#sudo ./llvm.sh 12
#sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-12 777
#sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 777
#sudo apt-get update
apt install clang-tidy -y									

									# if you want to use libclang
									#sudo apt-get install libc++abi-12-dev libc++-12-dev -y
									# Add the following environment variables to your `~/.bashrc` or `~/.zshrc` profiles:
									#if you want to use libclang
									#export CXXFLAGS=-stdlib=libc++
									#export LDFLAGS=-stdlib=libc++

export CXXFLAGS="-Wnounused-parameter -Wnodeprecated-declarations -w"
export CXX=clang++-14
export CC=clang-14




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
					#wget https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip
					#unzip ninja-linux.zip 
					#cp -rf ninja /usr/bin/
./vcpkg install
cd ../..




mkdir build
cd build              
cmake --build . --target help


#patch cmake to 3.30 for 3.18 and higher

wget https://github.com/Kitware/CMake/releases/download/v3.30.0-rc4/cmake-3.30.0-rc4-linux-x86_64.tar.gz
tar -xvf cmake-3.30.0-rc4-linux-x86_64.tar.gz 
cp -rf cmake-3.30.0-rc4-linux-x86_64/* /usr/



cmake -DCMAKE_BUILD_TYPE=Release ../ 
cmake --build . --config Release --target komodo-wallet
