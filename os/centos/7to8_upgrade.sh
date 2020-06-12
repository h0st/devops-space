#!/bin/bash

# Docs:
# 1. https://sysadmin.pm/centos-7-8-upgrade/
# 2. 
echo "Upgrading CentOS 7 to 8 ..."
cat /etc/centos-release

yum -y install epel-release yum-utils rpmconf
rpmconf -a -y                                       # https://linux.die.net/man/8/rpmconf
package-cleanup --orphans   # will be a list of packages to delete
package-cleanup --leaves    # will be a list of packages to delete
yum autoremove
# dnf
yum -y install dnf
dnf -y remove yum yum-metadata-parser
rm -Rf /etc/yum
dnf upgrade -y
# upgrade
dnf -y upgrade https://mirror.yandex.ru/centos/8/BaseOS/x86_64/os/Packages/centos-release-8.0-0.1905.0.9.el8.x86_64.rpm
dnf -y upgrade https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -e --nodeps sysvinit-tools
rpm -e `rpm -q kernel`
# if error delete pkg: dnf remove kmod-kvdo.x86_64
# update
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync
dnf -y install kernel-core
dnf -y groupupdate "Core" "Minimal Install"

echo "Upgrade finished!"
cat /etc/centos-release

exit 0