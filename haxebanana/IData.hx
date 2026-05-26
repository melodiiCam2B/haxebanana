package;
import haxe.Json;
/**
 * data structure class for GameBanana API's _aRecords cells
 */
class IData {
    public var version:String;
    public var files:Dynamic;
    public var raw_data:Dynamic;
    public function new(raw_data:Dynamic) {
        this.raw_data = raw_data;
        version = raw_data._sVersion;
        files = raw_data._aFiles;
    }
}