# ungoogled-chromium-freebsd

FreeBSD packaging for [ungoogled-chromium](//github.com/ungoogled-software/ungoogled-chromium).

## Downloads

Downloads are currently not available.

## Building

Refer to the [FreeBSD manual](https://docs.freebsd.org/en/books/handbook/ports/#ports-using) on how to setup the required ports collection.

Once the ports collection is setup, this package can be built using `make`.

### Hardware Requirements

* A 64-bit system is required, and 16 GB of RAM is highly recommended.

## Developer info

You must have Git, Quilt, and Python 3.6+ installed. These instructions work on both BSD and Linux distros.

To begin updating patches, clone this repository:
```
git clone https://github.com/tangalbert919/ungoogled-chromium-freebsd
```

Now setup the Chromium source:
```
./devutils/setup-chromium-source.sh
```

Edit the `FREEBSD_HASH` variable in the Makefile with the latest commit hash from [this website](https://github.com/freebsd/freebsd-ports/commits/main/www/chromium). You must get the **FULL** hash, not the shortened one with only seven characters. Edit the `PORTVERSION` variable in the same file with the version of Chromium corresponding to that commit hash.

Once you have edited both, pull the FreeBSD patches with `devutils/pull-freebsd-patches.sh`, and then apply them with `devutils/apply-freebsd-patches.sh`.

Setup and apply the Ungoogled-chromium patches:
```
./devutils/setup-ungoogled-patches.sh
./devutils/fix-ungoogled-patches.sh
source devutils/set_quilt_vars.sh
cd build/src
while quilt push; do quilt refresh; done
quilt pop -a
cd ../..
git add patches
```
If any of the patches fail, you must follow this procedure:
```
quilt push -f
# Apply the rejected hunks manually. Then run this command:
quilt refresh
while quilt push; do quilt refresh; done
```
Then you must continue with applying the patches.

## License

See [LICENSE](LICENSE)
