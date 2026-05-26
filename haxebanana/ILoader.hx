package haxebanana;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import haxebanana.IData;
import haxe.Json;
/**
 * Loader class to avoid clutter from the main file `HxBanana`
 */
class ILoader extends URLLoader{
    var base_url:String = "https://gamebanana.com/apiv11/Mod/";
    var json_raw:Dynamic;
    var contID:String;
    var data_array:Array<IData> = [];
    public function new (contID:String) {
        super();
        this.contID = contID;
        addEventListener("complete", function(e) {
            json_raw = Json.parse(e.target.data);
            if (json._aRecords == null || json._aRecords.length == 0) return;
            for ( i => update in json._aRecords) 
                data_array.push(new IData(update, i, contID));
        });
        load(new URLRequest('$base_url+$contID+/Updates?_t=0'));
    }
}