package haxebanana;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import sys.io.File;
import sys.io.FileOutput;
import haxebanana.ILoader;
import haxebanana.IData;
class IUpdate extends URLLoader{
    public var base_url:String = "https://gamebanana.com/dl/";
    public function new (data:Dynamic, downloadPath:String) {
        super();
        dataFormat = BINARY;

        ddEventListener(Event.COMPLETE, function(e) {
			var fileOutput:FileOutput = File.write('$downloadPath${data._sFile}', true);

			var bytes:ByteArray = new ByteArray();
			data.readBytes(bytes, 0, data.length - data.position);
			fileOutput.writeBytes(bytes, 0, bytes.length);
			fileOutput.flush();

			fileOutput.close();
		});
        load(new URLRequest('$base_url${data._idRow}'));
    }

}