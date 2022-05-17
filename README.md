Hướng dẫn cài đặt:
1. Cài đặt project Spring boot
	- Công cụ:	
		- Eclip 2022
		- Spring Tools 4 : https://openplanning.net/10249/cai-dat-spring-tool-suite-cho-eclipse
	- Hướng dẫn cài đặt:
		- Clone code từ github: 
git clone https://github.com/TienThan0712/TienThan0712-DATN_18T0121319_3TKeyStore.git
		- Copy folder vào workspace của Eclip
		- Import project trong Eclip
		- Sau khi import vào thì chuột phải vào tên project -> maven -> update maven
		- Chỉnh sửa đường dẫn cơ sở dữ liệu ở file application.properties
		- Chạy file main 
		- Truy cập web: localhost:8080/home
		- Tài khoản demo:
			- Người dùng: 
				- Username: KH1
				- Password: 1
			- Admin:
				- Username: Admin
				- Password: admin
2. Cài đặt cơ sở dữ liệu:
	- Công cụ:	SQL server 2019 Express + Full-Text trong gói cài đặt
	- Hướng dẫn cài đặt:
		- Tạo database có tên QLBanPhim
		- Chạy file Qlbanphim.sql
		- Chọn execute
3. Cài đặt Redis:
	- Công cụ: Redis
	- Hướng dẫn cài đặt:
		- Giải nén file Redis-x64-3.2.100.rar
		- Chạy file redis-server.exe

