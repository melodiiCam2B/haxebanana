# HaxeBanana

---

a [Haxe](https://haxe.org/) Library for interacting with the [GameBanana](https://gamebanana.com/) API!

the library gives easier access to the API data any given GameBanana page
as well as allowing you to download any and/or all of the files on it

---
# Variables

variables not listed here are not intended to be used normally
all though you can access them, due to most of them being public

```haxe
/**
 * variables in `HxBanana`
 * 
 * @param contID the only manual variable, responsible for setting the current `mod`
 * @param loader initial parser for the gamebanana API
 * @param downloads initial parser for the gamebanana files list
 * @param updater class used to download files from gamebanana
 * @param downloadPath path downloads are written into
 * 
 * arrays used to store data
 * @param data_array used to store update data
 * @param file_array used to store downloadable file data
 * 
 */

```

---

# Usage

```haxe 

import haxebanana.HxBanana;

class Main {
	static function main():Void {
        // initialize with the mod page id
        var banana = new HxBanana(000000);
        // once it's initialized, everything should work

        // this path gets set on initialization to the absolute path
        banana.downloadPath = '.temp/';
        // new path (Drive:)/env/.temp/updatefile.zip

        // download the second file of latest update
        // if no file that high exists, it's wrapped
        banana.updateByInt(0, 1);
        // empty <- downloads the latest update and first file

        // download specific file id or name
        // if no file by that name or id exists, throws null
        banana.updateByStr('updatefile.zip');
        // recommended for mods that update for multiple OS'
        }
}
```
---