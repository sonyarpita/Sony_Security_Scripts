modprobe brd rd_nr=1 rd_size=100000

#Cryptographic device mapper device was created in LUKS encryption mode :
cryptsetup -v luksFormat --cipher="aes-xts-plain64" /dev/ram0

#The partition was unlocked using the below command :
cryptsetup open --type luks /dev/ram0 map 

#The disk was formatted and mounted.
mkfs.ext3 /dev/mapper/map

