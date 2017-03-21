#!/usr/bin/env bash
cd ~

sudo apt-get update && sudo apt-get -y upgrade #http://askubuntu.com/questions/118025/bypass-the-yes-no-prompt-in-apt-get-upgrade
sudo apt-get -y install g++ #http://superuser.com/questions/164553/automatically-answer-yes-when-using-apt-get-install
sudo apt-get -y install git
sudo apt-get -y install make


sudo apt-get install build-essential libcurl4-openssl-dev libxml2-dev libssl-dev  # dependencies

# install gcc-6
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get install gcc-6 g++-6


# set c++ compiler to gcc-6 for multithreading support
sed -ie "s/# export CC = gcc/export CC = gcc-6/g" xgboost/make/config.mk
sed -ie "s/# export CXX = g++/export CXX = g++-6/g" xgboost/make/config.mk

sudo apt-get -y install python-setuptools
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; make -j4
cd python-package; sudo /home/ubuntu/anaconda3/bin/python setup.py install
var=$(pwd)
echo 'export PYTHONPATH='$var >> ~/.bashrc
