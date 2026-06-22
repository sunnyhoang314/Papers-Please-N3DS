# Papers-Please-3DS (WIP)
My attempt at creating a port of the popular indie game "Papers, Please" for the Nintendo 3DS

# How to compile the game 
1. Open Command Prompt from project folder
2. Enter command: ```3dstool -cvtf romfs new_romfs.bin --romfs-dir romfs_out```
3. Enter command: ```3dstool -cvtf cxi new_contents.cxi --header header.bin --exh exheader.bin --logo logo.bin --exefs exefs_raw.bin --romfs new_romfs.bin --not-encrypt```
4. Enter command: ```makerom -f cia -content new_contents.cxi:0:0 -o new_game.cia -ignoresign```
5. Transfer ```new_game.cia``` file onto SD card
6. Install CIA file via FBI application


