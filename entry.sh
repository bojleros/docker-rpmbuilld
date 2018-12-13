#!/bin/sh

set -e

if [[ -z ${GIT_REPO} ]]; then
  echo "Please provide GIT_REPO env !"
fi

if [[ ${GIT_HTTPS_VERIFY} != true ]]; then
  echo "Disabling ssl check for https"
  git config --global http.sslVerify false
fi

echo "# macros" >  ~/.rpmmacros
echo "%_topdir    /build" >> ~/.rpmmacros
echo "%_sourcedir %{_topdir}/SOURCES"        >> ~/.rpmmacros
echo "%_builddir  %{_topdir}/BUILDROOT"        >> ~/.rpmmacros
echo "%_specdir   %{_topdir}/SPECS"        >> ~/.rpmmacros
echo "%_rpmdir    %{_topdir}/RPMS"        >> ~/.rpmmacros
echo "%_srcrpmdir %{_topdir}/SRPMS"        >> ~/.rpmmacros

cd /build
REPODIR=$(git clone ${GIT_REPO} | grep "^Cloning into" | cut -d\' -f2)

shopt -s dotglob # Includes filenames beginning with a dot.
mv -- ${REPODIR}/* .    # Where foo/ is the folder consisting the files.
shopt -u dotglob # Disables previously enabled dotglob option.
rm -rf ${REPODIR}

/bin/sh build.sh
