@echo off
@REM set username=
@REM set password=

@REM :login
@REM cls
@REM echo ==================================
@REM echo Selamat datang di Program Akademik
@REM echo ==================================
@REM echo.
@REM set /p username=Username: 
@REM set /p password=Password: 

@REM if "%username%"=="lutfi" (
@REM     if "%password%"=="lutfi123" (
@REM         goto menu_akademik
@REM     ) else (
@REM         echo Password salah!
@REM         pause
@REM         goto login
@REM     )
@REM ) else (
@REM     echo Username salah!
@REM     pause
@REM     goto login
@REM )


:menu_akademik
cls
echo ==============
echo Menu Akademik
echo ==============
echo.
echo 1. Penilaian Mahasiswa
echo 2. Laporan Penilaian Mahasiswa
echo 3. Aplikasi Perhitungan
echo 4. Menu Perbaikan Komputer
echo 5. Menu Jaringan Komputer
echo 6. Menu Aplikasi
echo 7. Menu Setting
echo 8. Menu perhitungan bangunan
echo 9. Keluar
echo.

set /p pilihan=Masukkan pilihan: 

if "%pilihan%"=="1" (
    goto penilaian_mahasiswa
) else if "%pilihan%"=="2" (
    goto laporan_penilaian_mahasiswa
) else if "%pilihan%"=="3" (
    goto aplikasi_perhitungan
) else if "%pilihan%"=="4" (
    goto menu_perbaikan_komputer
) else if "%pilihan%"=="5" (
    goto menu_jaringan_komputer
) else if "%pilihan%"=="6" (
    goto menu_aplikasi
) else if "%pilihan%"=="7" (
    goto menu_setting
) else if "%pilihan%"=="8" (
    goto menu_perhitungan_bangunan
) else if "%pilihan%"=="9" (
    exit
) else (
    echo Pilihan tidak valid!
    pause
    goto menu_akademik
)

--------------------------
--------------------------
:menu_perhitungan_bangunan
cls
echo Menu perhitungan bangunan
echo.
echo 1. segitiga siku-siku
echo 2. persegi panjang
echo 3. Kembali ke Menu Akademik
echo.

set /p pilihan=Masukkan pilihan: 

if "%pilihan%"=="1" (
    goto segitiga_siku-siku
) else if "%pilihan%"=="2" (
    goto menu_perhitungan_bangunan
) else if "%pilihan%"=="3" (
    goto menu_akademik
) else (
    echo Pilihan tidak valid!
    pause
    goto menu_perhitungan_bangunan
)
:segitiga_siku-siku
echo.

    set /p angka1=Masukkan alas: 
    set /p angka2=Masukkan tinggi: 

    set /a hasil=%angka1% * %angka2% / 2
    echo.
    echo Hasil penjumlahan: %hasil%
    pause
    goto aplikasi_perhitungan_bangunan


echo.
pause
goto menu perhitungan bangunan
--------------------------
--------------------------

:penilaian_mahasiswa
cls
echo Menu Penilaian Mahasiswa
echo.
echo 1. Input Penilaian
echo 2. Kembali ke Menu Akademik
echo.

set /p pilihan=Masukkan pilihan: 

if "%pilihan%"=="1" (
    goto input_penilaian
) else if "%pilihan%"=="2" (
    goto menu_akademik
) else (
    echo Pilihan tidak valid!
    pause
    goto penilaian_mahasiswa
)

:input_penilaian
cls
setlocal enabledelayedexpansion
echo Input Penilaian
echo.

set /p nama_mahasiswa=Masukkan nama mahasiswa: 
set /p nim_mahasiswa=masukan nim mahasiswa:
set /p prodi_mahasiswa=masukan prodi mahasiswa:

cls
set mata_kuliah[1]=kewirausahaan & set sks[1]=2
set mata_kuliah[2]=etika profesi & set sks[2]=2
set mata_kuliah[3]=manajemen jaringan & set sks[3]=2
set mata_kuliah[4]=sistem operasi & set sks[4]=2
set mata_kuliah[5]=probabilitas statistika & set sks[5]=3
set mata_kuliah[6]=manajemen basis data & set sks[6]=3
set mata_kuliah[7]=rpl & set sks[7]=3
set mata_kuliah[8]=pbo & set sks[8]=4

for /L %%i in (1,1,8) do (
  echo mata_kuliah : !mata_kuliah[%%i]!
  echo sks : !sks[%%i]!
  set /p nilai[%%i]=Masukkan nilai: 

  if !nilai[%%i]! geq 81 ( if !nilai[%%i]! leq 100 ( set grade[%%i]=A & set bobot[%%i]=4.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 76 ( if !nilai[%%i]! leq 80 ( set grade[%%i]=AB & set bobot[%%i]=3.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 71 ( if !nilai[%%i]! leq 75 ( set grade[%%i]=B & set bobot[%%i]=3.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 66 ( if !nilai[%%i]! leq 70 ( set grade[%%i]=BC & set bobot[%%i]=2.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 61 ( if !nilai[%%i]! leq 65 ( set grade[%%i]=C & set bobot[%%i]=2.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 56 ( if !nilai[%%i]! leq 60 ( set grade[%%i]=CD & set bobot[%%i]=1.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 51 ( if !nilai[%%i]! leq 55 ( set grade[%%i]=D & set bobot[%%i]=1.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))
  if !nilai[%%i]! geq 0 ( if !nilai[%%i]! leq 50 ( set grade[%%i]=E & set bobot[%%i]=0.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i]))

  set /a total_sks+=sks[%%i]
  set /a total_bobot+=total_bobot[%%i]
)

REM Simpan data penilaian ke dalam file atau database
for /L %%i in (1,1,8) do (
  echo  ^|^| !sks[%%i]! ^|^| !nilai[%%i]! ^|^| !grade[%%i]! ^|^| !bobot[%%i]! ^|^| !mata_kuliah[%%i]! >> %nama_mahasiswa%.txt
)

echo.
echo Penilaian telah berhasil disimpan.
pause

goto penilaian_mahasiswa

--------------------------
--------------------------

:laporan_penilaian_mahasiswa
cls
echo Lihat Penilaian
echo.

REM Baca data penilaian dari file atau database
echo HASIL PENILAIAN MAHASISWA
echo --------------------------------------------
echo  ^|SKS ^|NILAI ^|GRADE ^|BOBOT ^|MATA_KULIAH
echo --------------------------------------------
type %nama_mahasiswa%.txt

echo.
pause
endlocal
goto menu_akademik

--------------------------
--------------------------

:aplikasi_perhitungan
cls
echo Menu Aplikasi Perhitungan
echo.
echo 1. Penjumlahan
echo 2. Pengurangan
echo 3. Perkalian
echo 4. Pembagian
echo 5. kembali ke menu akademik
echo.
set /p pilihan=Masukkan pilihan Anda (1-5):

if "%pilihan%"=="1" (
  goto penjumlahan
) else if "%pilihan%"=="2" (
  goto pengurangan
) else if "%pilihan%"=="3" (
  goto perkalian
) else if "%pilihan%"=="4" (
  goto pembagian
) else if "%pilihan%"=="5" (
  goto menu_akademik
) else (
  echo Pilihan tidak valid. Silakan coba lagi.
)

:penjumlahan
    cls
    echo Aplikasi Perhitungan - Penjumlahan
    echo.

    set /p angka1=Masukkan angka pertama: 
    set /p angka2=Masukkan angka kedua: 

    set /a hasil=%angka1% + %angka2%
    echo.
    echo Hasil penjumlahan: %hasil%
    pause
    goto aplikasi_perhitungan

:Pengurangan
    cls
    echo Aplikasi Perhitungan - Pengurangan
    echo.

    set /p angka1=Masukkan angka pertama: 
    set /p angka2=Masukkan angka kedua: 

    set /a hasil=%angka1% - %angka2%
    echo.
    echo Hasil pengurangan: %hasil%
    pause
    goto aplikasi_perhitungan

:perkalian
    cls
    echo Aplikasi Perhitungan - perkalian
    echo.

    set /p angka1=Masukkan angka pertama: 
    set /p angka2=Masukkan angka kedua: 

    set /a hasil=%angka1% * %angka2%
    echo.
    echo Hasil perkalian: %hasil%
    pause
    goto aplikasi_perhitungan

:pembagian
    cls
    echo Aplikasi Perhitungan - Pembagian
    echo.

    set /p angka1=Masukkan angka pertama: 
    set /p angka2=Masukkan angka kedua: 

    set /a hasil=%angka1% / %angka2%
    echo.
    echo Hasil pembagian: %hasil%
    pause
    goto aplikasi_perhitungan

pause
goto menu_akademik

--------------------------
--------------------------

:menu_perbaikan_komputer
cls
echo Menu Perbaikan Komputer
echo.
echo 1. Pembersihan Disk
echo 2. cek blutooth
echo 3. kembali ke menu akademik
echo.
set /p pilihan=Masukkan pilihan Anda (1-3): 

IF "%pilihan%"=="1" (
    cls
    echo Memilih Pembersihan Disk...
    cleanmgr
    pause
    goto menu_perbaikan_komputer

) ELSE IF "%pilihan%"=="2" (
    cls
    echo memilih cek blutooth...
    start msdt.exe -id  BluetoothDiagnostic
    pause
    goto menu_perbaikan_komputer
    

) else if "%pilihan%"=="3" (
  goto menu_akademik

) ELSE (
    echo Pilihan tidak valid.
    echo.
    pause
)

--------------------------
--------------------------

:menu_jaringan_komputer
cls
echo Menu Jaringan Komputer
echo.
echo 1. Cek IP Address Komputer
echo 2. Ping Google
echo 3. Kembali ke Menu akademik
echo.

set /p pilihan=Silakan pilih menu (1-3): 

 if "%pilihan%"=="1" (
  cls
  ipconfig | findstr /i "IPv4"
  pause
  goto menu_jaringan_komputer
) else if "%pilihan%"=="2" (
  cls
  echo Menjalankan ping ke Google...
  ping www.google.com -n 4
  pause
  goto menu_jaringan_komputer
) else if "%pilihan%"=="3" (
  goto menu_akademik
) else (
  echo Pilihan tidak valid. Silakan coba lagi.
  pause
  goto menu_jaringan_komputer
)

--------------------------
--------------------------

:menu_aplikasi
cls
echo Menu Aplikasi
echo.
echo 1. Microsoft Word
echo 2. Microsoft Excel
echo 3. Notepad
echo 4. kembali ke menu akademik
echo.
set /p pilihan=Masukkan pilihan Anda (1-4):

IF "%pilihan%"=="1" (
    start winword
) ELSE IF "%pilihan%"=="2" (
    start excel
) ELSE IF "%pilihan%"=="3" (
    start notepad
) else if "%pilihan%"=="4" (
    goto menu_akademik
) ELSE (
    echo Pilihan tidak valid.
)

echo.
pause
goto menu_aplikasi

--------------------------
--------------------------

:menu_setting
cls
echo Menu_Setting
echo.
echo 1. Setting Keyboard
echo 2. Setting Language
echo 3. Setting Sound
echo 4. Kembali ke Menu akademik
echo.

set /p pilihan=Silakan pilih menu (1-4): 

if "%pilihan%"=="1" (
  start control keyboard
) else if "%pilihan%"=="2" (
  start intl.cpl
) else if "%pilihan%"=="3" (
  start SndVol.exe
) else if "%pilihan%"=="4" (
  goto menu_akademik
) else (
  echo Pilihan tidak valid. Silakan coba lagi.
)

pause
goto menu_setting
