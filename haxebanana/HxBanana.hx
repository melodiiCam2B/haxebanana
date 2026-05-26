package;
import IData;
import IFile;
import ILoader;
import Downloader;
import IDownloads;
/**
 * main class, and really the only one you should be using
 * 
 * it holds all the functions you need! 
 * if a function is missing, I recommend extending it rather then directly editing
 */
class HxBanana {
    public var loader:ILoader;
    public var updater:Downloader;
    public var downloads:IDownloads;
    public var data_array:Array<IData> = [];
    public var file_array:Array<IFile> = [];
    public var downloadPath:String = '';
    public var contID:Int;

    public function new(contID:Int) {
        this.contID = contID;
        loader = new ILoader(contID, this);
        downloads = new IDownloads(contID, this);

        var str = '';
        str += '> HxBanana [haxebanana.HxBanana] Initilization Log\n';
        str += '> Owner: ${loader.json_raw._aRecords[0]._aSubmitter._sName} - Page ID ${contID}\n';
        str += '> Current Mod ID: ${loader.json_raw._aRecords[0]._aSubmission._sName}\n';
        str += '> Updates: ${loader.json_raw._aRecords.length} | Latest: ${loader.json_raw._aRecords[0]._sVersion}\n';
        str += '> File Id: ${loader.json_raw._aRecords[0]._aFiles[0]._idRow} | File Name: ${loader.json_raw._aRecords[0]._aFiles[0]._sFile}\n';

        Sys.println(str);

    }

    /**
     * [Description]\
     * keep values empty for latest and first file
     * @param cont specific update from updates array
     * @param file specific file from update files array
     */
    public function updateByInt(cont:Int = 0, file:Int = 0) {
        cont = wrap(cont, 0, data_array.length - 1);
        file = wrap(file, 0, Std.int(data_array[cont].files.length - 1));

        updater = new Downloader(data_array[cont].files[file], downloadPath);
    }

    /**
     * [Description]
     * @param file download only a file by a specific name
     */
    public function updateByStr(target:String) {
        for (data in file_array) {
            if (data.file == target) {
                updater = new Downloader(data.raw_data, downloadPath);
                break;
            }
        }
    }

    /**
        taken from FlxMath `https://github.com/HaxeFlixel/flixel/blob/master/flixel/math/FlxMath.hx#L281`
	 */
	public function wrap(value:Int, min:Int, max:Int):Int {
		var range:Int = max - min + 1;

		if (value < min)
			value += range * Std.int((min - value) / range + 1);

		return min + (value - min) % range;
	}

}