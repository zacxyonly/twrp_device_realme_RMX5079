# TWRP Device Tree for Realme P3 5G (RMX5079)

<div align="center">

![TWRP Logo](https://img.shields.io/badge/TWRP-Recovery_v3.7+-blue?style=for-the-badge&logo=android)
![Android Version](https://img.shields.io/badge/Android-14_(SDK_34)-green?style=for-the-badge&logo=android)
![SoC](https://img.shields.io/badge/SoC-Qualcomm_Snapdragon_6_Gen_4_(SM6650)-orange?style=for-the-badge&logo=qualcomm)
![Status](https://img.shields.io/badge/Status-Beta_Testing-yellow?style=for-the-badge)
[![Build TWRP Recovery](https://github.com/zacxyonly/twrp_device_realme_RMX5079/actions/workflows/twrp-build.yml/badge.svg)](https://github.com/zacxyonly/twrp_device_realme_RMX5079/actions/workflows/twrp-build.yml)

**Custom recovery configuration files for building TeamWin Recovery Project (TWRP) for the Realme P3 5G (RMX5079).**

</div>

---

## ⚠️ Disclaimer

> [!WARNING]
> Flashing or booting custom recoveries modifies system partitions. While testing with `fastboot boot` does not permanently overwrite your partitions, modifying your device carries inherent risks.
> - **We are not responsible** for bricked devices, dead SD cards, bootloops, or lost data.
> - Always perform a full backup of your critical data before proceeding.
> - Proceed at your own discretion!

---

## 📱 Device Specifications

| Specification | Details |
| :--- | :--- |
| **Device Model** | Realme P3 5G (`RMX5079` / `RMX5070`) |
| **Manufacturer** | Realme / OPLUS |
| **Chipset / SoC** | Qualcomm SM6650 ("volcano") - Snapdragon 6 Gen 4 |
| **CPU Architecture** | ARM64 (`arm64-v8a`), Octa-core (4x Cortex-A720 + 4x Cortex-A520) |
| **Kernel Version** | Linux 6.1.75-android14 GKI (Stock extracted) |
| **Boot Header** | Version 4 |
| **Partition Layout** | Virtual A/B (Dynamic Partitions: erofs / f2fs / ext4) |
| **Display Resolution** | 1080 x 2400 pixels (~20:9 aspect ratio) |
| **Touchscreen Panel** | FocalTech FT3518 / Novatek / Goodix / Synaptics |
| **Encryption Method** | File-Based Encryption (FBE v2) with WrappedKey |
| **Stock OS Base** | Realme UI (Android 14, API Level 34 - Stock Extracted) |

---

## ⚡ Current Status

- [x] Prebuilt Kernel GKI 6.1 extracted from stock `boot.img`
- [x] DTB & Bootconfig extracted from stock `vendor_boot.img`
- [x] OPLUS BSP Touchscreen kernel modules extracted & integrated
- [x] Boot Image Header v4 offsets and parameters configured
- [x] Dynamic Partitions (Super) configuration defined
- [x] Decryption (FBE v2 & WrappedKey) flags configured
- [x] MicroSD & USB-OTG mount support added
- [ ] Decryption verification on Android 14 (Awaiting Tester Logs)
- [ ] MTP file transfer verification (Awaiting Tester Logs)

---

## 🚀 Panduan Instalasi & Penggunaan (Installation Guide)

> [!IMPORTANT]
> **GUNAKAN PERINTAH `boot`, JANGAN `flash`!**  
> Untuk mencegah resiko *softbrick* atau *bootloop*, **JANGAN** lakukan `fastboot flash recovery recovery.img`.  
> Gunakan perintah `fastboot boot` agar TWRP dimuat sementara ke dalam RAM tanpa menimpa partisi recovery/boot internal perangkat. Jika ada kendala, perangkat cukup di-reboot dan akan kembali normal ke sistem bawaan.

### Langkah-langkah:

1. **Persiapan:**
   - Pastikan **Bootloader sudah di-unlock** (UBL).
   - Pastikan komputer sudah terpasang driver ADB & Fastboot terbaru.
   - Download file recovery hasil build (`recovery.img`) dari [GitHub Actions Artifacts](https://github.com/zacxyonly/twrp_device_realme_RMX5079/actions) atau halaman [Releases](https://github.com/zacxyonly/twrp_device_realme_RMX5079/releases).
   - Letakkan file `recovery.img` di folder yang sama dengan executable Fastboot.

2. **Masuk ke Fastboot Mode:**
   Hubungkan HP ke komputer dengan kabel USB, aktifkan USB Debugging, lalu jalankan:
   ```bash
   adb reboot bootloader
   ```
   *Atau matikan HP, lalu tekan dan tahan tombol **Power + Volume Down** hingga masuk ke mode Fastboot.*

3. **Periksa Koneksi:**
   ```bash
   fastboot devices
   ```
   *Pastikan serial number perangkat terdeteksi.*

4. **Boot TWRP (Temporary Boot):**
   ```bash
   fastboot boot recovery.img
   ```
   *Perangkat akan memuat TWRP secara langsung ke RAM.*

---

## 🧪 Panduan Menjadi Tester & Cara Kirim Debug Log

Bagi pengguna yang ingin membantu menguji coba (tester), laporan log sangat dibutuhkan terutama untuk mengecek fungsi touchscreen, mounting partisi, dan dekripsi internal storage.

### 1. Mengambil Log dari TWRP

Jika TWRP berhasil boot dan touchscreen berfungsi:
1. Masuk ke menu **Advanced** -> **Copy Log**.
2. Log akan disalin ke memori internal atau MicroSD / USB-OTG.
3. Sambungkan ke PC dan salin file `recovery.log`.

### 2. Mengambil Log via ADB (Jika Layar Sentuh Belum Respon)

Jika TWRP menyala namun layar sentuh belum merespon atau ada kendala lain, ambil log langsung lewat terminal PC menggunakan perintah ADB:

* **Mengambil Log TWRP Utama:**
  ```bash
  adb pull /tmp/recovery.log
  ```
* **Mengambil Log Kernel (dmesg):**
  ```bash
  adb shell dmesg > dmesg.txt
  ```
* **Mengambil Logcat Sistem:**
  ```bash
  adb logcat -d > logcat.txt
  ```

### 3. Mengirimkan Laporan Bug / Feedback

Silakan buat laporan baru melalui [GitHub Issues](https://github.com/zacxyonly/twrp_device_realme_RMX5079/issues) dengan format:
- **Device Info:** Realme P3 5G (RMX5079)
- **Versi Firmware / Realme UI:** Contoh: `RMX5079_14.0.1.XXX`
- **Gejala / Masalah:** Jelaskan secara rinci (misal: *touchscreen tidak merespon*, *memori internal terkunci/0MB*, *gagal mount partisi*, dsb.)
- **Lampiran File Log:** Wajib melampirkan file `recovery.log`, `dmesg.txt`, dan screenshot bila memungkinkan.

---

## 🔗 Sumber Repositori & Referensi (Source Repositories)

Pembuatan device tree dan sistem build TWRP ini menggunakan referensi dan sumber resmi berikut:

* **TWRP Minimal Manifest (Android 14):**  
  [minimal-manifest-twrp/platform_manifest_twrp_aosp](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp) (Branch: `twrp-14`)
* **TeamWin Recovery Source:**  
  [TeamWin/android_bootable_recovery](https://github.com/TeamWin/android_bootable_recovery) (Branch: `android-14`)
* **TeamWin Android Build Tools:**  
  [TeamWin/android_build](https://github.com/TeamWin/android_build) (Branch: `android-14.1`)
* **TeamWin Vendor TWRP:**  
  [TeamWin/android_vendor_twrp](https://github.com/TeamWin/android_vendor_twrp) (Branch: `android-14`)
* **LineageOS Hardware & Tools Repositories:**  
  [LineageOS](https://github.com/LineageOS) (Lineage-21.0 CAF dependencies & tools)
* **Kernel & OEM Drivers:**  
  Realme SM6650 ("volcano") BSP & Official Kernel Source Tree

---

## 👥 Kontributor & Kredit

- [TeamWin Project (TWRP)](https://twrp.me/) untuk custom recovery platform.
- [Minimal-Manifest-TWRP](https://github.com/minimal-manifest-twrp) untuk minimal compilation framework.
- [LineageOS](https://lineageos.org/) untuk CAF hardware interface libraries.
- Realme / OPLUS untuk kernel source & driver hardware.
- Seluruh komunitas tester & pengembang Android.
