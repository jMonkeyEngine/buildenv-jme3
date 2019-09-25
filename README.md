[![Actions Status](https://github.com/jMonkeyEngine/buildenv-jme3/workflows/Build%20Environments/badge.svg)](https://github.com/jMonkeyEngine/buildenv-jme3/actions)

# Build environments for jMonkeyEngine3

The master branch is automatically built and deployed to https://hub.docker.com/u/jmonkeyengine

### How to build locally

If you want to build the images locally for test and development, you will need a bash environment 
(eg any linux distribution with bash, macos, git|cywin|win bash on windows or windows 10 wsl) and docker.


Build and run
```bash
$ buildEnv="base" # linuxArm, android
$ bash make.sh build buildenv-jme3 $buildEnv
$ docker run --rm -it buildenv-jme3:$buildEnv bash
```

Build and deploy to a docker registry
```bash
$ buildEnv="base" # linuxArm, android
$ bash make.sh build buildenv-jme3 $buildEnv NAMESPACE
$ build make.sh deploy buildenv-jme3 $buildEnv NAMESPACE REGISTRY_USER REGISTRY_PASSWORD REGISTRY_URL
```
