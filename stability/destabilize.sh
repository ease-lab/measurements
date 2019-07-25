#!/bin/bash -e

echo Set CPU frequency
sudo cpupower frequency-set -g ondemand
echo Disabled turbo boost
sudo sh -c 'echo 1 > /sys/devices/system/cpu/cpufreq/boost'
echo Disabled THP
sudo sh -c "echo madvise > /sys/kernel/mm/transparent_hugepage/enabled"
sudo sh -c "echo madvise > /sys/kernel/mm/transparent_hugepage/defrag"
echo Disabled NUMA balancing
sudo sh -c "echo 1 > /proc/sys/kernel/numa_balancing"

echo System is stable now
echo WARNING: Make sure to set kernel boot args: usbcore.autosuspend=-1 intel_pstate=disable intel_iommu=on iommu=pt nokaslr rhgb quiet tsc=reliable cpuidle.off=1 idle=poll intel_idle.max_cstate=0 processor.max_cstate=0 intel_idle.max_cstate=0 processor.max_cstate=0 pcie_aspm=off pcie_aspm=off processor.ignore_ppc=1
echo Check dmesg output:
dmesg | head -n 3 | tail -n 1
