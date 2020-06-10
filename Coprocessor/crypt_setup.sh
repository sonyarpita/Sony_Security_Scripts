modprobe brd rd_nr=1 rd_size=4000000


cryptsetup -v luksFormat --cipher="aes-xts-plain64" /dev/ram0

cryptsetup open --type luks /dev/ram0 map

mkfs.ext3 /dev/mapper/map


mount /dev/mapper/map /mnt/

cd /mnt/
pwd

 fio --ioengine=libaio --direct=1 --runtime=30 --time_based --thread=1 --numjobs=16 --iodepth=16 --bs=4K --rw=randread --group_reporting  --name=xx --size 1M 
