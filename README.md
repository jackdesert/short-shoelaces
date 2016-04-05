Shoelaces
=========

ShortShoelaces.com uses [Plim](https://github.com/avanov/Plim) to generate html.


Setup
-----

    pip3 install plim watchdog


Watch Files
-----------

Start the watcher

    bin/watcher.sh


Edit File
---------

    vi src/index.plim


View generated file in browser
------------------------------

    firefox index.html


Convert Original Files to Smaller Size
--------------------------------------

    cp images-original <new_dir>
    cd <new_dir>
    mogrify -path . -resize 400x400 -quality 75  *.jpg


Publish
-------

    # Everything
    scp -r index.html style.css .htaccess images $jj:webapps/shortshoelaces

    # No Images
    scp -r index.html style.css .htaccess $jj:webapps/shortshoelaces
