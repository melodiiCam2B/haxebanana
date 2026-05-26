package;
import IData;
import IFile;
import HxBanana;
import haxe.Json;
import haxe.Http;
/**
 * Loader class to avoid clutter from the main file `HxBanana`
 */
class IDownloads extends Http {
    public var parent:HxBanana;
    public var base_url:String = "https://gamebanana.com/apiv11/Mod/";
    public var json_raw:Dynamic;
    public var file_array:Array<IFile> = [];
    public function new (contID:Int, parent:HxBanana) {
        this.parent = parent;
        super(base_url+contID+'/DownloadPage');
		this.onData = function(e) {
            json_raw = Json.parse(e);

            for ( i in 0...json_raw._aArchivedFiles.length ) 
                file_array.push(new IFile(json_raw._aArchivedFiles[i]));
            
            for ( i in 0...json_raw._aFiles.length ) 
                file_array.push(new IFile(json_raw._aFiles[i]));

            parent.file_array = file_array;
		}
		this.request();
    }
}