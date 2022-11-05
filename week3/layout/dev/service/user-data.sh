#!/bin/bash
wget https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-x86_64
mv busybox-x86_64 busybox
chmod +x busybox
IID=$(curl 169.254.169.254/latest/meta-data/instance-id)

cat > index.html <<EOF
<h1>T101 Study</h1>
<p>Hello</p>
<p>Instance ID($IID)!!</p>
<p>My RDS DB address: ${db_address}</p>
<p>My RDS DB port: ${db_port}</p>
EOF

nohup ./busybox httpd -f -p \${server_port} &
