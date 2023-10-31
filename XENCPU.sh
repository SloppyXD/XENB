#!/bin/bash

echo "-------------------------"
echo "       XENBLOCKS         "
echo "    STARTING INSTALL     "
echo "        for CPU          "
echo "-------------------------"

sudo apt update > /dev/null 2>&1
echo "STEP 1 of 10: Completed Packages Update"

sudo apt -y install ocl-icd-opencl-dev > /dev/null 2>&1
echo "STEP 2 of 10: Installed OpenCL"

sudo apt -y install nano  > /dev/null 2>&1
echo "STEP 3 of 10: Installed Nano"

sudo apt -y install cmake  > /dev/null 2>&1
echo "STEP 4 of 10: Installed cMake"

sudo apt -y install python3-pip > /dev/null 2>&1
echo "STEP 5 of 10: Installed Python"

git clone https://github.com/jacklevin74/xenminer.git > /dev/null 2>&1
echo "STEP 6 of 10: Cloned https://github.com/jacklevin74/xenminer.gitt"
mkdir cd XENCPUMiner > /dev/null 2>&1
cd XENCPUMiner
chmod +x build.sh > /dev/null 2>&1
./build.sh > /dev/null 2>&1
echo "STEP 7 of 10: Permissions set!"

sed -i 's/account = 0xA725A7E78b93A6D202Ce48B439ae4392769a8aa3/account = 0x99bf865A579B17e3609fc0152eCEB19941B87A06/g' config.conf > /dev/null 2>&1
echo "STEP 8 of 10: Replaced ETH address"

sudo pip install -U -r requirements.txt > /dev/null 2>&1
echo "STEP 9 of 10: Installed Python Requirements"

echo "STEP 10 of 10: Starting Miner on CPU"
sudo nohup python3 miner.py 2>&1 &
sudo for i in {1..25}; do nohup python3 miner.py & done  > /dev/null 2>&1


echo "-------------------------"
echo "    MINING  XENBLOCKS    "
echo "-------------------------"
echo " "
tail -f /root/XENGPUMiner/miner.log
