#!/bin/bash

# Docs:
# 1. https://sysadmin.pm/centos-7-8-upgrade/
# 2. 
echo "Upgrading CentOS 7 to 8 ..."
cat /etc/centos-release

yum install -y rpmconf epel-release yum-utils
rpmconf -a -y                                       # https://linux.die.net/man/8/rpmconf
package-cleanup --orphans
package-cleanup --leaves
yum autoremove
# dnf
yum install -y dnf
dnf remove -y yum yum-metadata-parser
rm -Rf /etc/yum
dnf upgrade -y
# upgrade
dnf upgrade -y https://mirror.yandex.ru/centos/8/BaseOS/x86_64/os/Packages/centos-release-8.0-0.1905.0.9.el8.x86_64.rpm
dnf upgrade -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -e --nodeps sysvinit-tools
rpm -e `rpm -q kernel`
# if error delete pkg: dnf remove kmod-kvdo.x86_64
# update
dnf --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync -y
dnf install -y kernel-core
dnf groupupdate -y "Core" "Minimal Install"

echo "Upgrade finished!"
cat /etc/centos-release

exit 0