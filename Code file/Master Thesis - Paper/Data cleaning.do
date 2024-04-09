set more off

cd "E:\K2meep\Final Project\Thesis\Code"

use "E:\K2meep\Final Project\Thesis\Data\thesisdata.dta", replace

/*
sieuamkythun
ngaysinh
tiensusinhconhoichungdown
ngaythuchien_thainhi
dukiensinh
chieudaidaumong
dau_duongkinhluongdinh
dau_chuvidau
mat_moimui
mat_khoangcach2homat
mat_xuongsongmui
nguc_nhiptimthai
nguc_ditattim
chi_chieudaixuongdui
d_mom_pappa
d_mom_hcgb
t_mom_ue3
t_mom_afp
t_mom_hcg
d_khoangsangsaugay
ketluan_hoichungdown
*/

**# Tạo biến tuổi mẹ
gen tuoime = year(dofc(ngaythuchien_thainhi)) - year(dofc(ngaysinh))
replace tuoime = . if tuoime < 16 | tuoime > 55	
replace tuoime = year(dofc(ngaythuchien_thaiphu)) - year(dofc(ngaysinh)) if tuoime == .
replace tuoime = . if tuoime < 16 | tuoime > 55	
replace tuoime = year(dofc(ngaythuchien_NST)) - year(dofc(ngaysinh)) if tuoime == .
replace tuoime = . if tuoime < 16 | tuoime > 55
replace tuoime = year(dofc(d_ngaythuchien)) - year(dofc(ngaysinh)) if tuoime == .
replace tuoime = . if tuoime < 16 | tuoime > 55
replace tuoime = year(dofc(t_ngaythuchien)) - year(dofc(ngaysinh)) if tuoime == .
replace tuoime = . if tuoime < 16 | tuoime > 55
replace tuoime = year(dofc(ngaythuchien_nipt)) - year(dofc(ngaysinh)) if tuoime == .
replace tuoime = . if tuoime < 16 | tuoime > 55
replace tuoime = year(dofc(ngaythuchien_thala_thaiphu)) - year(dofc(ngaysinh)) if tuoime == .
replace tuoime = . if tuoime < 16 | tuoime > 55
replace tuoime = 30 if tuoime == .

**# Tạo biến tuổi thai
replace tuoithai_ngay = . if tuoithai_ngay > 6
replace tuoithai_ngay = 0 if tuoithai_ngay == .
replace tuoithai_tuan = . if tuoithai_tuan < 11 | tuoithai_tuan > 23
gen tuoithai = tuoithai_tuan * 7 + tuoithai_ngay

replace sieuamkythun = 1 if tuoithai <= 97 & (sieuamkythun == 2 | sieuamkythun == 3 | sieuamkythun == 4)
replace sieuamkythun = 2 if tuoithai >= 105 & tuoithai != . & (sieuamkythun == 1 | sieuamkythun == 3 | sieuamkythun == 4)

**# Làm sạch biến 
replace ketluan_hoichungdown = . if ketluan_hoichungdown == 0

replace chieudaidaumong = . if sieuamkythun == 2
replace chieudaidaumong = . if (chieudaidaumong > 600 | chieudaidaumong < 35) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace chieudaidaumong = . if chieudaidaumong < 38 & dulieu_kiemdinh == 1 & sieuamkythun == 1

replace dau_duongkinhluongdinh = . if (dau_duongkinhluongdinh > 31 | dau_duongkinhluongdinh == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace dau_duongkinhluongdinh = . if dau_duongkinhluongdinh > 29 & dulieu_kiemdinh == 1 & sieuamkythun == 1
replace dau_duongkinhluongdinh = . if (dau_duongkinhluongdinh > 64 | dau_duongkinhluongdinh < 17) & dulieu_kiemdinh == 0 & sieuamkythun == 2

replace dau_chuvidau = . if (dau_chuvidau > 107 | dau_chuvidau < 48) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace dau_chuvidau = . if (dau_chuvidau > 100 | dau_chuvidau < 54) & dulieu_kiemdinh == 1 & sieuamkythun == 1
replace dau_chuvidau = . if (dau_chuvidau > 227 | dau_chuvidau < 82) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace dau_chuvidau = . if (dau_chuvidau > 225 | dau_chuvidau < 90) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace dau_naothatben = . if sieuamkythun == 1
replace dau_naothatben = . if (dau_naothatben > 7 | dau_naothatben < 3) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace dau_naothatben = . if (dau_naothatben > 7 | dau_naothatben < 3) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace mat_khoangcach2homat = . if sieuamkythun == 1
replace mat_khoangcach2homat = . if (mat_khoangcach2homat > 28 | mat_khoangcach2homat < 12) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace mat_khoangcach2homat = . if (mat_khoangcach2homat > 28 | mat_khoangcach2homat < 10) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace mat_xuongsongmui = . if sieuamkythun == 1
replace mat_xuongsongmui = . if (mat_xuongsongmui > 9 | mat_xuongsongmui < 1.2) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace mat_xuongsongmui = . if (mat_xuongsongmui > 9 | mat_xuongsongmui < 1.4) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace nguc_nhiptimthai = . if (nguc_nhiptimthai > 196 | nguc_nhiptimthai < 128) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace nguc_nhiptimthai = . if (nguc_nhiptimthai > 196 | nguc_nhiptimthai < 137) & dulieu_kiemdinh == 1 & sieuamkythun == 1
replace nguc_nhiptimthai = . if (nguc_nhiptimthai > 177 | nguc_nhiptimthai < 130) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace nguc_nhiptimthai = . if (nguc_nhiptimthai > 175 | nguc_nhiptimthai < 135) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace chi_chieudaixuongdui = . if (chi_chieudaixuongdui > 14 | chi_chieudaixuongdui < 3) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace chi_chieudaixuongdui = . if (chi_chieudaixuongdui > 14 | chi_chieudaixuongdui < 3) & dulieu_kiemdinh == 1 & sieuamkythun == 1
replace chi_chieudaixuongdui = . if (chi_chieudaixuongdui > 46 | chi_chieudaixuongdui < 7) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace chi_chieudaixuongdui = . if (chi_chieudaixuongdui > 40 | chi_chieudaixuongdui < 7) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace d_mom_pappa = . if sieuamkythun == 2
replace d_mom_pappa = . if (d_mom_pappa > 1.75 | d_mom_pappa < 0.03) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace d_mom_pappa = . if (d_mom_pappa > 1.75 | d_mom_pappa < 0.03) & dulieu_kiemdinh == 1 & sieuamkythun == 1

replace d_mom_hcgb = . if sieuamkythun == 2
replace d_mom_hcgb = . if (d_mom_hcgb > 3.15 | d_mom_hcgb == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace d_mom_hcgb = . if (d_mom_hcgb > 3.15 | d_mom_hcgb == 0) & dulieu_kiemdinh == 1 & sieuamkythun == 1

replace t_mom_ue3 = . if sieuamkythun == 1
replace t_mom_ue3 = . if (t_mom_ue3 > 1.92 | t_mom_ue3 == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace t_mom_ue3 = . if (t_mom_ue3 > 1.92 | t_mom_ue3 == 0) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace t_mom_afp = . if sieuamkythun == 1
replace t_mom_afp = . if (t_mom_afp > 1.53 | t_mom_afp == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace t_mom_afp = . if (t_mom_afp > 1.53 | t_mom_afp == 0) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace t_mom_hcg = . if sieuamkythun == 1
replace t_mom_hcg = . if (t_mom_hcg > 4.5 | t_mom_hcg == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 2
replace t_mom_hcg = . if (t_mom_hcg > 4.5 | t_mom_hcg == 0) & dulieu_kiemdinh == 1 & sieuamkythun == 2

replace d_khoangsangsaugay = . if sieuamkythun == 2
replace d_khoangsangsaugay = . if (d_khoangsangsaugay > 4 | d_khoangsangsaugay == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace d_khoangsangsaugay = . if (d_khoangsangsaugay > 4 | d_khoangsangsaugay == 0) & dulieu_kiemdinh == 1 & sieuamkythun == 1
replace d_khoangsangsaugay = co_khoangsangsaugay if d_khoangsangsaugay == .
replace d_khoangsangsaugay = . if sieuamkythun == 2
replace d_khoangsangsaugay = . if (d_khoangsangsaugay > 5.9 | d_khoangsangsaugay == 0) & dulieu_kiemdinh == 0 & sieuamkythun == 1
replace d_khoangsangsaugay = . if (d_khoangsangsaugay > 5.9 | d_khoangsangsaugay == 0) & dulieu_kiemdinh == 1 & sieuamkythun == 1

**# Fill dữ liệu thiếu
replace chieudaidaumong = 61 if chieudaidaumong == . & sieuamkythun == 1 & tuoime != . & tuoithai != . & tiensusinhconhoichungdown != .
replace dau_duongkinhluongdinh = 33 if dau_duongkinhluongdinh == . & dulieu_kiemdinh == 0 & sieuamkythun != . & tuoime != . & tuoithai != . & tiensusinhconhoichungdown != .
replace dau_chuvidau = 128 if dau_chuvidau == . & dulieu_kiemdinh == 0 & sieuamkythun != . & tuoime != . & tuoithai != . & tiensusinhconhoichungdown != . 
replace nguc_nhiptimthai = 155 if nguc_nhiptimthai == . & dulieu_kiemdinh == 0 & sieuamkythun != . & tuoime != . & tuoithai != . & tiensusinhconhoichungdown != .
replace chi_chieudaixuongdui = 20 if chi_chieudaixuongdui == . & dulieu_kiemdinh == 0 & sieuamkythun != . & tuoime != . & tuoithai != . & tiensusinhconhoichungdown != .

replace d_hcgb = . if d_hcgb > 400 & d_donvi_hcgb == 1
replace d_hcgb = . if (d_hcgb > 150 | d_hcgb == 0) & d_donvi_hcgb == 2
replace d_hcgb = . if (d_hcgb > 403 | d_hcgb == 0) & d_donvi_hcgb == 3

**# Lọc dữ liệu siêu âm thai kỳ 1
keep if dulieu_kiemdinh == 1 & sieuamkythun == 1 & !missing(tuoime) & !missing(tuoithai) & !missing(tiensusinhconhoichungdown) & !missing(chieudaidaumong) & !missing(dau_duongkinhluongdinh) & !missing(dau_chuvidau) & !missing(mat_moimui) & !missing(nguc_nhiptimthai) & !missing(d_khoangsangsaugay) & !missing(ketluan_hoichungdown)
keep sieuamkythun tuoime tuoithai tiensusinhconhoichungdown chieudaidaumong dau_duongkinhluongdinh dau_chuvidau mat_moimui nguc_nhiptimthai d_khoangsangsaugay ketluan_hoichungdown

**# Lọc dữ liệu siêu âm thai kỳ 2
keep if dulieu_kiemdinh == 1 & sieuamkythun == 2 & !missing(tuoime) & !missing(tuoithai) & !missing(tiensusinhconhoichungdown) & !missing(dau_duongkinhluongdinh) & !missing(dau_chuvidau) & !missing(dau_naothatben) & !missing(mat_moimui) & !missing(mat_khoangcach2homat) & !missing(mat_xuongsongmui) & !missing(nguc_nhiptimthai) & !missing(nguc_ditattim) & !missing(chi_chieudaixuongdui) & !missing(ketluan_hoichungdown)
keep sieuamkythun tuoime tuoithai tiensusinhconhoichungdown dau_duongkinhluongdinh dau_chuvidau dau_naothatben mat_moimui mat_khoangcach2homat mat_xuongsongmui nguc_nhiptimthai nguc_ditattim chi_chieudaixuongdui ketluan_hoichungdown

