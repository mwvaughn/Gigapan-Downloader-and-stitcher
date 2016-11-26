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

```
Usage: gigafetch.py [-h] [--imageid IMAGEID] [--resolution RESOLUTION]
                    [--format {psb,tif}] [--delay DELAY] [--montage MONTAGE]

Optional arguments:
  -h, --help            show this help message and exit
  --imageid IMAGEID     Gigapan Image Identifier
                        (http://www.gigapan.com/gigapans/<IMAGEID>)
  --resolution RESOLUTION
                        Gigapan Image Resolution (0 = maximum available)
  --format {psb,tif}    Output format (tif)
  --delay DELAY         Minimum time in seconds between HTTP requests (0.1s)
  --montage MONTAGE     Full path to ImageMagick montage binary
  ```

### Docker

You may also use this application in a Dockerized format. Either pull the image from ```tacc/gigafetch``` or build an image yourself with the included Dockerfile.

### Example

Fetch this Gigapan image [http://www.gigapan.com/gigapans/130095](http://www.gigapan.com/gigapans/130095) at maximum resolution, saving it as a TIFF image. Make each request to Gigapan as fast as possible by setting *delay* to 0.

```
docker build -t tacc/gigafetch .
docker run -t -v $PWD:/home:rw tacc/gigafetch --imageid 130095 --resolution 0 --delay 0 --format tif

+----------------------------
| Max size: 12417x4125px
| Max number of tiles: 49x17 tiles = 833 tiles
| Max level: 6
| Tile size: 256
+----------------------------
| Image to download:
| Size: 12418x4126px
| Number of tiles: 49x17 tiles = 833 tiles
| Level: 6
+----------------------------

Starting download...
(49/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/0/48 as 0000-0048.jpg
(98/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/1/48 as 0001-0048.jpg
(147/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/2/48 as 0002-0048.jpg
(196/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/3/48 as 0003-0048.jpg
(245/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/4/48 as 0004-0048.jpg
(294/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/5/48 as 0005-0048.jpg
(343/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/6/48 as 0006-0048.jpg
(392/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/7/48 as 0007-0048.jpg
(441/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/8/48 as 0008-0048.jpg
(490/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/9/48 as 0009-0048.jpg
(539/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/10/48 as 0010-0048.jpg
(588/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/11/48 as 0011-0048.jpg
(637/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/12/48 as 0012-0048.jpg
(686/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/13/48 as 0013-0048.jpg
(735/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/14/48 as 0014-0048.jpg
(784/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/15/48 as 0015-0048.jpg
(833/833) Downloading http://www.gigapan.org/get_ge_tile/130095/6/16/48 as 0016-0048.jpg
Done
Stitching...
Done
Cleaning up download...
Done

```

_Forked from [Gigapan Panorama Downloader](https://github.com/DeniR/Gigapan-Downloader-and-stitcher_
