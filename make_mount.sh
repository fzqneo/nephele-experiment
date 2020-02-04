#!/bin/bash

mkdir /mnt/orders-mnt /mnt/lineitem-mnt
mount -v us-east.nephele.findcloudlet.org:/srv/nfs4/tpch /mnt/orders-mnt
mount -v de.nephele.findcloudlet.org:/srv/nfs4/tpch /mnt/lineitem-mnt

