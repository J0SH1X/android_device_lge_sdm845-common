#
# vendor props for joan
#


# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.offload.video=false \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.ras.enabled=false \
    ro.vendor.audio.sdk.fluencetype=none \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio_hal.period_size=480 \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.noisy.broadcast.delay=600 \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.pstimeout.secs=3 \
    vendor.audio.offload.track.enable=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.safx.pbe.enabled=false \
    vendor.audio.tunnel.encode=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.fm.a2dp.conc.disabled=true \
    vendor.voice.path.for.pcm.voip=false

# Audio - DAC
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.hifi_adv_support=1 \
    ro.config.hifi_enhance_support=1 \
    audio.hifi_rec.normal_gain=0 \
    audio.hifi_rec.normal_lcf=75 \
    audio.hifi_rec.normal_lmt=0 \
    audio.hifi_rec.concert_gain=-140 \
    audio.hifi_rec.concert_lcf=0 \
    audio.hifi_rec.concert_lmt=0 \
    audio.hifi_rec.offset_gain=39

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.chip.vendor=qcom \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    vendor.qcom.bluetooth.soc=cherokee \
    vendor.bluetooth.soc=cherokee \
    qcom.bluetooth.soc=cherokee

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.expose.aux=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1 \
    ro.opengles.version=196610 \
    ro.sf.lcd_density=480

# Factory reset partition
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# HDR
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qcom.hdr.config=/vendor/etc/hdr_tm_config.xml

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.port=I2C

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.dpm.feature=0 \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.data.mode=concurrent \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.sib16_support=1 \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ril.subscription.types=NV,RUIM \
    ro.telephony.default_network=10 \
    ro.use_data_netmgrd=true \
    ro.vendor.use_data_netmgrd=true \
    telephony.lteOnCdmaDevice=1

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.debug.sensors.daemon=d \
    persist.vendor.debug.sensors.hal=d \
    persist.vendor.sensors.diag_buffer_mode=false

# Sensors (Sar)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.lge.sar_keeponoff=on \
    persist.vendor.lge.sar_dependmode=on \
    persist.vendor.lge.sar_fakestatus=off 

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config.extra=none

# Vibration
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.immvibed.fakeandrvers=8

# VNDK
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    ro.vndk.version=28

# Voice assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Waterproof
PRODUCT_PROPERTY_OVERRIDES += \
    ro.support.waterproof=true
