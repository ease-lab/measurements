The following scripts are used to (de)stabilize the environment for the measurements.

### Prerequisites

* Set BIOS option “CPU Power Management” to “OS DBPM” to allow `acpi-cpufreq` driver to load instead of Intel P-state driver. Need to add kernel boot argument `intel_pstate=disable`

* Add kernel boot arguments.
```
usbcore.autosuspend=-1 intel_pstate=disable intel_iommu=on iommu=pt nokaslr rhgb quiet tsc=reliable
cpuidle.off=1 idle=poll intel_idle.max_cstate=0 intel_idle.max_cstate=0 processor.max_cstate=0
pcie_aspm=off pcie_aspm=off processor.ignore_ppc=1

```

Reference: [link](https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt). Most important ones are:
* `tsc=reliable` mark tsc clocksource as reliable, this disables clocksource verification at runtime, as well as the stability checks done at bootup. Used to enable high-resolution timer mode on older hardware, and in virtualized environment.

* `idle=poll` disables power efficient polling.

* `*cstate*` doesn't let cpus go to sleep.

* `pcie_aspm-off` disables PCIe power management.

* `kaslr` disables the page table maping fix for side-channel attacks.
