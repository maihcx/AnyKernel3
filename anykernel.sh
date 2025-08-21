### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers 
# 禁止二改，小心黑砖

### AnyKernel setup
# global properties
properties() { '
kernel.string=KernelSU by KernelSU Developers
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/core.sh

kernel_version=$(cat /proc/version | awk -F '-' '{print $1}' | awk '{print $3}')
case $kernel_version in
    5.1*) ksu_supported=true ;;
    6.1*) ksu_supported=true ;;
    6.6*) ksu_supported=true ;;
    *) ksu_supported=false ;;
esac

ui_print "$(echo '5YaF5qC45p6E5bu66ICFOiDlsI8g5bCPdw==' | base64 -d)"
ui_print "$(echo 'S2VybmVsIEJ1aWxkZXIgOiB4aWFveGlhb3c=' | base64 -d)"
ui_print " "
ui_print "$(echo -e '5pys5YaF5qC45rC45LmF5YWN6LS577yB77yB5LqM5qyh5YCS5Y2W55qENDAwMCs=' | base64 -d)"
ui_print "$(echo 'RnJlZSBrZXJuZWzvvIHvvIFTdGVhbGluZyBhbmQgc2VsbGluZyB0byB0aGUgZGVhdGggb2YgdGhlIHdob2xlIGZhbWlseQ==' | base64 -d)"
ui_print " "
ui_print "$(echo 'UGxlYXNlIEpvaW4gT3VyIFRlbGVncmFtIEdyb3Vw' | base64 -d)"
ui_print "$(echo 'VGVsZWdyYW0gQGdraV9rZXJuZWxzX3hpYW94aWFvdw==' | base64 -d)"
ui_print " "
ui_print "感谢使用，祝您体验愉快"
ui_print "Thanks for using And wish you a great experience."
ui_print " " "  -> ksu_supported: $ksu_supported"
$ksu_supported || abort "  -> Non-GKI device, abort."

ui_print "Installing....."

# boot install
if [ -L "/dev/block/bootdevice/by-name/init_boot_a" -o -L "/dev/block/by-name/init_boot_a" ]; then
    split_boot # for devices with init_boot ramdisk
    flash_boot # for devices with init_boot ramdisk
else
    dump_boot # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk
    write_boot # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
fi
## end boot install
