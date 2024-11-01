#!/data/data/com.termux/files/usr/bin/bash
folder=ubuntu
if [ -d "$folder" ]; then
	first=1
	echo "skip"
fi
tarball="ubuntu.tar.xz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "download"
		wget "https://github.com/EXALAB/Anlinux-Resources/master/Rootfs/Ubuntu/arm64/ubuntu-rootfs-arm64.tar.xz" -O $tarball
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "unpack"
	proot --link2symlink tar -xJf ${cur}/${tarball}||:
	cd "$cur"
fi
mkdir -p ubuntuos
bin=ubuntu.sh
echo "create script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A ubuntuos)" ]; then
    for f in ubuntuos/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b ubuntu/root:/dev/shm"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fix shebang of $bin"
termux-fix-shebang $bin
echo "setting $bin"
chmod +x $bin
echo "removing image"
rm $tarball
echo "run ./${bin}"
rm -rf ubuntuos.sh
