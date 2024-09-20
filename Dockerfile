# ใช้ base image เป็น Ubuntu
FROM ubuntu:20.04

# ตั้งค่าไม่ให้มีการถามคำถามระหว่างการติดตั้งแพ็คเกจ
ENV DEBIAN_FRONTEND=noninteractive

# อัปเดตระบบและติดตั้งแพ็คเกจที่จำเป็น
RUN apt-get update && \
	apt-get install -y \
	build-essential \
	git \
	libmysqlclient-dev \
	zlib1g-dev \
	libpcre3-dev \
	libssl-dev && \
	rm -rf /var/lib/apt/lists/*

# สร้างผู้ใช้ใหม่เพื่อความปลอดภัย
RUN useradd -ms /bin/bash rathena

# สลับไปใช้ผู้ใช้ rathena
USER rathena
WORKDIR /home/rathena

# คลอน rAthena จาก GitHub
RUN git clone https://github.com/rathena/rathena.git

# เข้าไปในไดเร็กทอรี rAthena
WORKDIR /home/rathena/rathena

# คอมไพล์ rAthena
RUN ./configure && make server

# เปิดพอร์ตที่จำเป็น
EXPOSE 6900 6121 5121

# ตั้งค่า ENTRYPOINT
CMD ["bash", "-c", "./login-server && ./char-server && ./map-server"]