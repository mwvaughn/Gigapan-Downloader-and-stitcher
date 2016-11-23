Gigafetch
=========

This Python 2.7.x script downloads Gigapan.com pictures at the resolution specified and stitches them together (very quickly) either as PSB (Photoshop Large Image file) or TIFF using Imagemagick. It supports resumable downloads and throttling. 

### Installation
1. Ensure ImageMagick 6.7.+ is installed
2. Clone this repository: ```git clone https://github.com/mwvaughn/gigafetch.git```
3. Find out the path to the ImageMagick *montage* command: ```which montage```
4. If it's different than ```/usr/bin/montage``` then edit the value of ```default_montage_path``` to match the location of your *montage* binary.
5. Ensure the script is executable ```chmod a+x gigafetch.py``` and move/copy it to a location in your ```PATH```

### Usage

### Docker

You may also use this application in a Dockerized format. Either pull the image from ```tacc/gigafetch``` or build an image yourself with the included Dockerfile.

```
docker build -t gigafetch .
docker run -v $PWD:/home:rw gigafetch 67804 0
```

Example, http://www.gigapan.com/gigapans/130095  
The \<imageid> is 130095

gigafetch.py 130095 5  
This will download the level 5 image tiles into directory "130095" and will make gigapan image "130095-giga.psb"
Important: If you want to download the highest resolution level avaiable choose level 0  

### Note

Gigapan site is very slow, also this script use only one thread. If you want to add multithreaded download - you are welcome.
You can try with different resolution levels to see the size of the image that will be downloaded and choose the level you need, just remember to delete the downloaded tiles

docker build -t tacc/gigafetch .
docker run --dns 8.8.8.8 -v /mnt/data/loris:/home:rw tacc/gigafetch gigafetch.py 67804 0

_Forked from [Gigapan Panorama Downloader](https://github.com/DeniR/Gigapan-Downloader-and-stitcher_
