#fallocate -l 1K 1K 

echo "Creating 1K file"
dd if=/dev/urandom of=1K bs=1024 count=1 iflag=fullblock status=progress
#fallocate -l 1M 1M 
echo "Creating 1M file"
dd if=/dev/urandom of=1M bs=1024 count=1024 iflag=fullblock status=progress
#fallocate -l 1G 1G 
echo "Creating 1G file"
dd if=/dev/urandom of=1G bs=1024 count=1024000 iflag=fullblock status=progress
#fallocate -l 2G 2G 
echo "Creating 2G file"
dd if=/dev/urandom of=2G bs=1024 count=2048000 iflag=fullblock status=progress

