# CarHackingResearch
A simple vehicle CAN data logger script made with Bash and runs on Macchina P1 (Under-The-Dash)

## Technologies & Hardware Requirements 

  - [Macchina P1 (Under-The-Dash)](https://www.macchina.cc/catalog/p1-boards/p1-under-dash)
  - USB-A to Micro-USB cable
  - Linux
  - PuTTY or Bitvise
  
## Setup

#### 1) Follow the steps provided in the [P1 documentation](https://docs.macchina.cc/p1-docs/getting-started) to setup the P1
#### 2) Run ```dataLogger.sh``` at startup
Add ```dataLogger.sh``` to any directory you want, run the crontab command ```Sudo crontab -e``` and add the the following command at the end of the file ```@reboot sleep 60 && <your path>/dataLogger.sh``` This will run the script exactly one minute after startup

## Troubleshoot
#### 1) You followed the P1 documentation but running the command ```candump -cae can0,0:0,#FFFFFFFF``` shows nothing in the terminal
If you have this problem, there are two things you can try:
  - Try different bitrates in the set up command ```sudo ip link set can0 type can bitrate 250000 listen-only on```
  - Connect to the P1 using a serial port connection through PuTTY using the following settings: 115200 baud, 8-N-1 configuration (8 data bits, no parity and one stop bit) 

#### 2) You tried the above solution but you still can't see any data when you run the ```candump``` command
If the first solution didn't work your CAN bus might be uni-directional and only responds to queries made by the user. You can check this by running the following command which queries the vehicle VIN number ```cansend can0 7df#0209020000000000``` if you get a dataframe back then that means your connection is correct but your OBD-II connector is uni-directional.

## Example Data
```
  can0  160   [7]  31 23 26 00 08 FF E8
  can0  180   [8]  14 37 32 63 12 00 3D 10
  can0  182   [8]  00 00 00 00 00 1D 00 C5
  can0  1F9   [8]  20 20 14 37 00 00 4E 80
  can0  2DE   [8]  02 00 80 05 F0 00 0D 96
  can0  3AB   [4]  00 03 00 55
  can0  002   [5]  66 FF 00 07 43
  can0  284   [8]  00 00 00 00 00 00 28 AE
  can0  285   [8]  00 00 00 00 00 00 28 AF
  can0  280   [8]  03 DF 80 00 00 00 A1 40
  can0  5C5   [8]  44 01 58 B6 00 0C 00 7F
  can0  174   [8]  65 46 54 AA 0D 00 00 00
  can0  176   [7]  00 1E 00 26 DE E0 6D
  can0  177   [8]  FE 10 40 00 00 00 00 00
  can0  421   [3]  08 00 00
  can0  560   [6]  AC 14 30 06 7F C0
  can0  1A5   [7]  3F FE 00 00 00 32 24
  can0  2DE   [8]  02 00 80 05 F0 00 0D 96
  can0  160   [7]  31 23 25 00 08 FF E8
  can0  180   [8]  14 50 32 53 12 00 3E 10
  can0  182   [8]  00 00 00 00 00 1E 00 C5
  can0  1F9   [8]  20 20 14 50 00 00 4E 80
  can0  60D   [8]  08 06 18 00 00 00 40 00
  can0  002   [5]  66 FF 00 07 34
  can0  215   [7]  FF F0 FF 30 FF FF 00
  can0  216   [2]  40 00
  can0  245   [8]  FF E0 00 18 29 10 FF E1
  ```
