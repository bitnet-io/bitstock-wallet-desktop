Package: openssl:x64-linux -> 3.1.4#1

**Host Environment**

- Host: x64-linux
- Compiler: GNU 11.3.1
-    vcpkg-tool version: 2023-11-16-4c1df40a3c5c5e18de299a99e9accb03c2a82e1e
    vcpkg-scripts version: 9a00db042 2023-12-01 (7 weeks ago)

**To Reproduce**

`vcpkg install `
**Failure logs**

```
-- Downloading https://github.com/openssl/openssl/archive/openssl-3.1.4.tar.gz -> openssl-openssl-openssl-3.1.4.tar.gz...
-- Extracting source /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/downloads/openssl-openssl-openssl-3.1.4.tar.gz
-- Applying patch disable-apps.patch
-- Applying patch disable-install-docs.patch
-- Applying patch script-prefix.patch
-- Applying patch windows/install-layout.patch
-- Applying patch windows/install-pdbs.patch
-- Applying patch unix/android-cc.patch
-- Applying patch unix/move-openssldir.patch
-- Applying patch unix/no-empty-dirs.patch
-- Applying patch unix/no-static-libs-for-shared.patch
-- Using source at /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/src/nssl-3.1.4-c5488d00d9.clean
openssl requires Linux kernel headers from the system package manager.
   They can be installed on Alpine systems via `apk add linux-headers`.
   They can be installed on Ubuntu systems via `apt install linux-libc-dev`.

-- Getting CMake variables for x64-linux
-- Getting CMake variables for x64-linux-dbg
-- Getting CMake variables for x64-linux-rel
-- Configuring x64-linux-dbg
CMake Error at scripts/cmake/vcpkg_execute_required_process.cmake:112 (message):
    Command failed: /usr/bin/bash -c "V=1 ./../src/nssl-3.1.4-c5488d00d9.clean/vcpkg/configure  \"/usr/bin/perl\" \"/home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/src/nssl-3.1.4-c5488d00d9.clean/Configure\" \"linux-x86_64\" \"enable-static-engine\" \"enable-capieng\" \"no-ssl3\" \"no-weak-ssl-ciphers\" \"no-tests\" \"no-shared\" \"no-module\" \"no-apps\" \"--openssldir=/etc/ssl\" \"--libdir=lib\" \"--disable-silent-rules\" \"--verbose\" \"--disable-shared\" \"--enable-static\" \"--debug\" \"--prefix=/home/c4pt/opt/komodo-wallet-desktop/vcpkg_installed/x64-linux/debug\""
    Working Directory: /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/x64-linux-dbg
    Error code: 2
    See logs for more information:
      /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/config-x64-linux-dbg-err.log

Call Stack (most recent call first):
  scripts/cmake/vcpkg_configure_make.cmake:832 (vcpkg_execute_required_process)
  ports/openssl/unix/portfile.cmake:105 (vcpkg_configure_make)
  ports/openssl/portfile.cmake:71 (include)
  scripts/ports.cmake:170 (include)



```
<details><summary>/home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/config-x64-linux-dbg-err.log</summary>

```
+ /usr/bin/perl /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/src/nssl-3.1.4-c5488d00d9.clean/Configure linux-x86_64 enable-static-engine enable-capieng no-ssl3 no-weak-ssl-ciphers no-tests no-shared no-module no-apps --openssldir=/etc/ssl --libdir=lib --debug --prefix=/home/c4pt/opt/komodo-wallet-desktop/vcpkg_installed/x64-linux/debug
Can't locate FindBin.pm in @INC (you may need to install the FindBin module) (@INC contains: /usr/local/lib64/perl5/5.34 /usr/local/share/perl5/5.34 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/src/nssl-3.1.4-c5488d00d9.clean/Configure line 15.
BEGIN failed--compilation aborted at /home/c4pt/opt/komodo-wallet-desktop/ci_tools_atomic_dex/vcpkg-repo/buildtrees/openssl/src/nssl-3.1.4-c5488d00d9.clean/Configure line 15.
```
</details>

**Additional context**

<details><summary>vcpkg.json</summary>

```
{
  "name": "komodo-wallet",
  "version-string": "0.7.1",
  "dependencies": [
    "entt",
    "boost-multiprecision",
    "boost-filesystem",
    "boost-thread",
    "boost-random",
    "boost-lockfree",
    "boost-stacktrace",
    "doctest",
    "fmt",
    "nlohmann-json",
    "range-v3",
    "libsodium",
    "spdlog",
    {
      "name": "spdlog",
      "features": [
        "wchar",
        "wchar-filenames"
      ],
      "platform": "windows"
    },
    {
      "name": "date",
      "features": [
        "remote-api"
      ],
      "platform": "windows"
    },
    "date",
    "cpprestsdk",
    "taskflow"
  ]
}

```
</details>
