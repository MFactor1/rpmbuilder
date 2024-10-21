#!/bin/bash

SRC_DIR=$1
NAME=`basename $SRC_DIR`
BLD_DIR=/home/$USER/rpmbuild
LICENSE_DIR=$SRC_DIR/LICENSE
VERSION_DIR=$SRC_DIR/VERSION
BIN_SRC_DIR=$SRC_DIR/build
SPEC_DIR=$SRC_DIR/pkg/rpm

VERSION=`cat $VERSION_DIR`

rm -rf $BLD_DIR
mkdir $BLD_DIR
mkdir $BLD_DIR/BUILD
mkdir $BLD_DIR/BUILDROOT
mkdir $BLD_DIR/RPMS
mkdir $BLD_DIR/SOURCES
mkdir $BLD_DIR/SPECS
mkdir $BLD_DIR/SRPMS

mkdir $BLD_DIR/SOURCES/$NAME-$VERSION

cp $BIN_SRC_DIR/* $BLD_DIR/SOURCES/$NAME-$VERSION/
cp $LICENSE_DIR $BLD_DIR/SOURCES/$NAME-$VERSION/
cp $VERSION_DIR $BLD_DIR/SOURCES/$NAME-$VERSION/

tar -czvf $BLD_DIR/SOURCES/$NAME-$VERSION.tar.gz -C $BLD_DIR/SOURCES $NAME-$VERSION

cp $SPEC_DIR/$NAME.spec $BLD_DIR/SPECS/

rpmbuild -bb $BLD_DIR/SPECS/git-auto-commiter.spec

cp -rTv $BLD_DIR/RPMS/ $SPEC_DIR/

rm -rf $BLD_DIR
