# TWRP Device Tree for Realme P3 5G (RMX5079)

## Device Specifications
- **Device**: Realme P3 5G
- **Model**: RMX5079
- **Platform**: Qualcomm SM6650 ("volcano")
- **Architecture**: arm64-v8a
- **Kernel Version**: Linux 6.1.75 GKI
- **Header Version**: 4
- **Partition Scheme**: Virtual A/B (Dynamic Partitions: erofs / f2fs)
- **Encryption**: File-Based Encryption (FBE v2) with WrappedKey
- **Display Resolution**: 1080 x 2400

## Status
- [x] Extracted Kernel GKI 6.1 from stock `boot.img`
- [x] Extracted DTB & Bootconfig from stock `vendor_boot.img`
- [x] Extracted OPLUS Touchscreen modules from `vendor_ramdisk`
- [x] Configured `BoardConfig.mk` with exact header v4, offsets, and bootconfig
- [x] Configured `recovery.fstab` and `twrp.flags` for dynamic partitions
- [x] Added automated GitHub Actions build workflow

## How to Build via GitHub Actions
1. Push this folder to a GitHub repository (e.g., `device_realme_RMX5079`).
2. Go to the **Actions** tab on your GitHub repo.
3. Select **Build TWRP Recovery** and click **Run workflow**.
4. Once completed, download `recovery.img` from the workflow Artifacts.
