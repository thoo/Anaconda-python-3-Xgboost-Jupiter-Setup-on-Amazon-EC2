#!/usr/bin/env bash


sudo apt-get update && sudo apt-get -y upgrade #http://askubuntu.com/questions/118025/bypass-the-yes-no-prompt-in-apt-get-upgrade
sudo apt-get -y install g++ #http://superuser.com/questions/164553/automatically-answer-yes-when-using-apt-get-install
sudo apt-get -y install git
sudo apt-get -y install make
sudo apt-get -y install gcc
sudo apt-get -y install python-setuptools
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; make -j4
cd python-package; sudo /home/ubuntu/anaconda3/bin/python setup.py install
var=$(pwd)
echo 'export PYTHONPATH='$var >> ~/.bashrc

