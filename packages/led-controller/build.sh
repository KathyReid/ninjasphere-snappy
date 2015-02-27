#!/bin/bash

REPO_URL=git@github.com:ninjasphere/sphere-go-led-controller.git
REPO_PATH=sphere-go-led-controller

. ../packaging.sh

clone-latest ${REPO_PATH} ${REPO_URL}
build-go-intermediates ${REPO_PATH} "linux/arm"

begin-build-staging

	install-intermediate-single-arch "linux/arm" "sphere-go-led-controller"

	# extra stuff
	cp -R ${REPO_PATH}/ninjapack/root/opt/ninjablocks/drivers/sphere-go-led-controller/* ${STAGING_DIR}

	apply-template-staging

	mkdir -p ${STAGING_DIR}/bin
	cp ${REPO_PATH}/ninjapack/root/usr/local/bin/reset-led-matrix ${STAGING_DIR}/bin/

	snappy-build-staging

#clean-build-staging
