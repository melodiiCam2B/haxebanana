# HxBanana!

---

a [Haxe](https://haxe.org/) Library for interacting with the [GameBanana](https://gamebanana.com/) API!

the library by itself doesn't do much other than give quick access to API data from any given GameBanana page
you can download from it, but it's very limited

---

# Usage

```haxe 

import haxebanana.HxBanana;

class Main {
	static function main():Void {
        // initialize with the mod page id
        var banana = new HxBanana('000000');

        // get first download id for the first file of the latest update
        trace(banana.arr[0].contFiles[0]._idRow);

        // download the third file of latest update
        // if no file that high exists, it's wrapped back
        banana.updateByInt(0, 0);
        // (0, 0) <- downloads the latest update and first file

        // download specific file id or name
        // if no file by that name or id exists, throws null
        banana.updateByStr('updatefile.zip');
        // recommended for mods that update for multiple OS'

        // this path gets set on initialization to the absolute path of this script
        banana.downloadPath = '.temp/';
        // new path (Drive:)/env/.temp/updatefile.zip
	}
}

```
---