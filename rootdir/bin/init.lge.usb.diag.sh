#!/vendor/bin/sh

diag_enable=$1

target_operator=`getprop ro.vendor.lge.build.target_operator`
case "$target_operator" in
    "SPR" | "TRF")
        exit 1
        ;;
    *)
        plmn=`getprop ro.boot.vendor.lge.plmn`
        if [ "$plmn" == "SPR" ]; then
            echo -ne \
" *******************************************************\n" \
 "**   WARNING WARNING WARNING WARNING WARNING WARNING \n"   \
 "**\n"                                                      \
 "** [ro.vendor.lge.build.target_operator]: [$target_operator]\n" \
 "** [ro.boot.vendor.lge.plmn]: [$plmn]\n"                   \
 "**\n"                                                      \
 "** target_operator and plmn do not match.\n"               \
 "** USB diag interface may cause problems.\n"               \
 "**\n"                                                      \
 "**   WARNING WARNING WARNING WARNING WARNING WARNING \n"   \
 "*******************************************************\n" \
> /dev/kmsg
            exit 1
        fi
        ;;
esac

if [ "$diag_enable" != "" ]; then
    echo "$diag_enable" > /sys/devices/platform/lg_diag_cmd/diag_enable
fi
