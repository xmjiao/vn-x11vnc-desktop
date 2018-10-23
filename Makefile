
PREFIX=/cm/shared/apps/singularity
SING_VERSION=2.6.0
IMAGE_REPO=shared-images

all:
	@echo make build for converting Docker to Singularity
	@echo make install for installing x11vnc-desktop

build: vn_x11vnc_desktop_latest.simg

install: build
	mkdir -p ${PREFIX}/${SING_VERSION}/${IMAGE_REPO}
	cp vn_x11vnc_desktop_latest.simg ${PREFIX}/${SING_VERSION}/${IMAGE_REPO}
	cp x11vnc-desktp.in ${PREFIX}/${SING_VERSION}/bin/x11vnc-desktop
	@echo ${PREFIX}/${SING_VERSION}/${IMAGE_REPO}/vn_x11vnc_desktop_latest.simg >> ${PREFIX}/${SING_VERSION}/bin/x11vnc-desktop
	chmod a+x ${PREFIX}/${SING_VERSION}/bin/x11vnc-desktop

vn_x11vnc_desktop_latest.simg:
	singularity pull --name $@ docker://chiao/vn-x11vnc-desktop:latest ./$@
