package;
import openfl.Lib;
import openfl.events.Event;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.events.ProgressEvent;
import sys.io.File;
import sys.io.FileOutput;

/**
 * utility class for downloading files to avoid clutter from the main file `HxBanana`
 */
class Downloader extends URLLoader {
    public var base_url:String = "https://gamebanana.com/dl/";
    public var file:Dynamic;

    public function new (file:Dynamic, downloadPath:String) {
        this.file = file;
        super();
        dataFormat = BINARY;

        addEventListener(Event.COMPLETE, function(e) {
			var fileOutput:FileOutput = File.write('$downloadPath${file._sFile}', true);

			var bytes:ByteArray = new ByteArray();
			data.readBytes(bytes, 0, data.length - data.position);
			fileOutput.writeBytes(bytes, 0, bytes.length);
			fileOutput.flush();

			fileOutput.close();

            printIn();
		});
        load(new URLRequest(base_url+file._idRow));
    }
    public function printIn(?str:String = '\n') {
        str += '> Downloader [haxebanana.Downloader] Downlaod Log\n';
        str += '> Version Downloaded: ${file._sVersion} | File Size ${size(bytesTotal)}\n';
        str += '> File Id: ${file._idRow} | File Name: ${file._sFile}\n';
        
        Sys.println(str);
    }

    private var sizeLabels:Array<String> = ["B", "KB", "MB", "GB", "TB"];

	public  function size(size:Float):String {
		var rSize:Float = size;
		var label:Int = 0;
		var len = sizeLabels.length;
		while(rSize >= 1024 && label < len-1) {
			label++;
			rSize /= 1024;
		}
		return Std.int(rSize) + ((label <= 1) ? "" : "." + addZeros(Std.string(Std.int((rSize % 1) * 100)), 2)) + sizeLabels[label];
	}

	public function addZeros(str:String, num:Int) {
		while(str.length < num) str = '0${str}';
		return str;
	}
}