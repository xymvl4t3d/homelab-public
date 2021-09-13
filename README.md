# homelab

Welcome to my homelab. (work in progress)

![alt text](https://github.com/xymvl4t3d/homelab-public/blob/main/home-network-v1.png?raw=true)

Internet -> 1Gbps Up/Down
ONT Modem -> Fiber to RJ45
TP-Link AX10 -> Router (Wireless Off)
Powerline -> Provide hardwired connection to streaming TV in master bedroom & backup wifi (for unifi AP upgrade/maintenance)
US-8 -> Provide POE+ power & connection to U6-LR
CRS305 -> Provide 10 Gbps connection between workstation and TrueNAS server
Workstation -> Specs: CPU: 6th Gen i7 (8 virtual cores), 32 GB RAM, 512 GB SSD (Boot), 1 TB NVMe SSD (Data)
TrueNAS -> Specs: CPU: 1st Gen Xeon (8 virtual cores), 16 GB RAM, 4 x 1 TB (in RAIDZ2, 1.69 TB total), 128 GB NVMe SSD (Boot), 8 GB USB drive (for Clover UEFI Boot)
homelab -> Intel NUC 10 i7, 12 virtual cores, 64 GB RAM, 1 TB SATA SSD, 1 TB NVMe SSD, ESXi 7.0U2c, VMs: kms, wireguard, eve-ng, opnsense
node01 -> Intel NUC 11 i5, 8 virtual cores, 64 GB RAM, 512 GB SATA SSD, Proxmox VE 7.0-11, VMs: ubuntu, rhel, opnsense, win-svr-2019
node02 -> Intel NUC 11 i5, 8 virtual cores, 64 GB RAM, 512 GB SATA SSD, Proxmox VE 7.0-11, VMs: ubuntu, rhel, opnsense, win-svr-2019 (for HA/LB)
