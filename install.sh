# clone tuxjdk:
#hg clone https://code.google.com/p/tuxjdk tuxjdk
#git clone https://github.com/mageddo/tuxjdk/ tuxjdk

# getting a jdk source (you can also download from http://hg.openjdk.java.net/)
#hg clone http://hg.openjdk.java.net/jdk8/jdk8 jdk8-tuxjdk
cd jdk8-tuxjdk
bash get_source.sh
# run helper script to apply tuxjdk onto openjdk sources:
../tuxjdk/applyTuxjdk.sh
# tuxjdk applied, now we can create external build folder:
cd ..
mkdir build
cd build
# and run helper script to configure and make tuxjdk images,
# script takes 3 arguments: openjdk source folder, bootstrap jdk and build number:
../tuxjdk/configureBuildOpenjdk.sh ../jdk8-tuxjdk /home/system/programs/java/jdk1.7.0-amd64-font-fixed b00
# now wait until the build is complete, and go see the images:
ls images/j2sdk-image
ls images/j2re-image
