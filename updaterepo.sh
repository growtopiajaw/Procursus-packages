GPG_TTY=$(tty)
export GPG_TTY
cd /opt/procursus/Procursus/repo
apt-ftparchive packages pool/main/big_sur > dists/big_sur/main/binary-darwin-amd64/Packages
pushd dists/big_sur/main/binary-darwin-amd64
gzip -c9 Packages > Packages.gz
xz -c9 Packages > Packages.xz
zstd -c19 Packages > Packages.zst
bzip2 -c9 Packages > Packages.bz2
popd
pushd dists/big_sur
apt-ftparchive release -c /Users/growtopiajaw/Downloads/big_sur.conf . > Release
cat Release | gpg --default-key growtopiajaw@gmail.com -abs > Release.gpg
cat Release | gpg --default-key growtopiajaw@gmail.com -abs --clearsign > InRelease
popd
