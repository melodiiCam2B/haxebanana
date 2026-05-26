package haxebanana;
import haxe.Json;
/**
 * Data storage structure class
 * it has no use outside of splitting the data
 */
class IData {
    public var version:String;
    public var content_id:String;
    public var raw_data:Dynamic;
    public var data_rec:Int;
    public function new(raw_data:Dynamic, data_rec:Int, content_id:String) {
        this.raw_data = raw_data;
        this.data_rec = data_rec;
        version = raw_data._sVersion;
        this.content_id = content_id;
    }
}