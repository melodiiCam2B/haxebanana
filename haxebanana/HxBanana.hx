package haxebanana;
import haxebanana.IData;
import haxebanana.ILoader;
import haxebanana.IUpdate;
/**
 * main class, and really the only one you should be using
 * 
 * it holds all the functions you need! 
 * if a function is missing, I recommend extending it rather then directly editing
 */
class HxBanana {
    public var loader:ILoader;
    public var updater:IUpdate;
    public var arr:Array<IData> = [];
    public var downloadPath:String;
    var contID:String;
    public function new(contID:String) {
        this.contID = contID;

        loader = new ILoader(contID);
        arr = loader.data_array;
    }

    /**
     * [Description]
     * @param cont specific update from updates array
     * @param file specific file from update files array
     */
    public static function updateByInt(cont:Int, file:Int) {
        cont = wrap(cont, 0, arr.length - 1);
        file = wrap(file, 0, arr[cont].contFiles.length - 1);
        // arr[cont].contFiles[file]._idRow
        // arr[cont].contFiles[file]._sFile
    }


    public static function updateByStr(file:String) {

        // arr[cont].contFiles[file]._idRow
        // arr[cont].contFiles[file]._sFile
    }

    /**
        taken from FlxMath `https://github.com/HaxeFlixel/flixel/blob/master/flixel/math/FlxMath.hx#L281`
	 */
	public static function wrap(value:Int, min:Int, max:Int):Int {
		var range:Int = max - min + 1;

		if (value < min)
			value += range * Std.int((min - value) / range + 1);

		return min + (value - min) % range;
	}

}