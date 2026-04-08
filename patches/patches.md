# Documentación de Parches - LineageOS 10 (Q) para Xiaomi Mi Pad 1 (mocha)

# Patch Documentation - LineageOS 10 (Q) for Xiaomi Mi Pad 1 (mocha)

Este archivo detalla el propósito y la funcionalidad de los parches aplicados en el árbol de dispositivos para adaptar el hardware antiguo del SoC Nvidia Tegra a las versiones modernas de Android (AOSP 10+).

*This file details the purpose and functionality of the patches applied in the device tree to adapt legacy Nvidia Tegra SoC hardware to modern Android versions (AOSP 10+).*

## Resumen de Parches / Patch Summary

### 1. `GLSurfaceView.patch`
**Ruta / Path:** `frameworks/base/`

* **Propósito:** Permite que el canal alfa de EGL sea mayor o igual al solicitado (`a >= mAlphaSize`).
* **Función:** Evita bloqueos en la inicialización de aplicaciones OpenGL cuando los drivers gráficos (Legacy) devuelven una configuración de bits de canal alfa superior a la solicitada estrictamente por el framework.

* **Purpose:** Allows the EGL alpha channel to be greater than or equal to the requested size (`a >= mAlphaSize`).
* **Function:** Prevents crashes during OpenGL application initialization when legacy graphics drivers return an alpha channel bit configuration higher than strictly requested by the framework.

### 2. `AnimationWindows.patch`
**Ruta / Path:** `frameworks/base/`

* **Propósito:** Desactiva las animaciones de ventanas y transiciones por defecto.
* **Función:** Establece las escalas de animación a `0.0f` en el arranque inicial. Esto mejora significativamente la percepción de fluidez en dispositivos con hardware antiguo al ahorrar recursos de GPU/CPU.

* **Purpose:** Disables window animations and transitions by default.
* **Function:** Sets animation scales to `0.0f` on initial boot. This significantly improves perceived smoothness on legacy hardware by saving GPU/CPU resources.

### 3. `libstageftight.patch`
**Ruta / Path:** `frameworks/av/`

* **Propósito:** Rediseño del renderizado de software para la conversión de color YUV a RGB.
* **Función:** Asegura que el alineamiento de memoria sea compatible con el hardware Tegra (ajuste a potencias de 16). Corrige artefactos visuales y corrupción gráfica durante la reproducción de vídeo mediante códecs de software.

* **Purpose:** Redesign of software rendering for YUV to RGB color conversion.
* **Function:** Ensures memory alignment is compatible with Tegra hardware (aligned to powers of 16). Fixes visual artifacts and graphical corruption during video playback using software codecs.

### 4. `disable_HW.patch`
**Ruta / Path:** `frameworks/native/`

* **Propósito:** Implementa la propiedad `debug.sf.disable_hwc`.
* **Función:** Permite forzar el renderizado a través de la GPU (GLES) ignorando el Hardware Composer (HWC) si este último presenta inestabilidades, parpadeos o fallos críticos en versiones modernas de Android.

* **Purpose:** Implements the `debug.sf.disable_hwc` property.
* **Function:** Allows forcing rendering through the GPU (GLES), bypassing the Hardware Composer (HWC) if the latter presents instabilities, flickering, or critical failures on modern Android versions.

### 5. `add_root.patch` & `system_extras_su.patch`
**Ruta / Path:** `system/core/` y `system/extras/`

* **Propósito:** Root nativo y permisos de superusuario permisivos.
* **Función:** Ajusta permisos de `su` (`06755`) y deshabilita comprobaciones de UID en el binario `su`. Facilita pruebas de desarrollo y permite un acceso root constante desde el primer arranque sin necesidad de gestores externos en etapas de testing.

* **Purpose:** Native root and permissive superuser permissions.
* **Function:** Adjusts `su` permissions (`06755`) and disables UID checks in the `su` binary. Facilitates development testing and allows constant root access from initial boot without requiring external managers during testing phases.

### 6. `exposer_arm_libm_map.patch`
**Ruta / Path:** `bionic/libm/`

* **Propósito:** Exponer funciones matemáticas obsoletas en el mapa de librerías.
* **Función:** Permite que los "Vendor Blobs" (controladores propietarios de cámara, GPU, etc.) se enlazen correctamente eliminando errores de símbolos no encontrados (`UnsatisfiedLinkError`) al momento de cargar binarios antiguos compilados contra versiones previas de Bionic.

* **Purpose:** Expose legacy math functions in the library map.
* **Function:** Allows "Vendor Blobs" (proprietary camera, GPU drivers, etc.) to link correctly by resolving missing symbol errors (`UnsatisfiedLinkError`) when loading legacy binaries compiled against previous Bionic versions.

### 7. `resolve_fence_leak.patch`
**Ruta / Path:** `hardware/interfaces/`

* **Propósito:** Corrección de fuga de descriptores de archivos (File Descriptors) en el HWC Adapter.
* **Función:** Fuerza el cierre de los `acquireFenceFd` en la capa de adaptación de HWC 2.x a 1.x. Sin esto, el sistema agota los descriptores disponibles, provocando congelamientos o reinicios automáticos del dispositivo tras unos minutos de uso.

* **Purpose:** Fix for File Descriptor (FD) leaks in the HWC Adapter.
* **Function:** Forces the closure of `acquireFenceFd` in the HWC 2.x to 1.x abstraction layer. Without this, the system exhausts available descriptors, causing device freezes or automatic reboots after a few minutes of use.
