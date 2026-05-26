package haxebanana;
import haxebanana.IData;
import haxebanana.ILoader;
class HxBanana{
    public var loader:ILoader;
    public var arr:Array<IData> = [];
    var contID:String;
    public function new(contID:String) {
        this.contID = contID;

        loader = new ILoader(contID);
        arr = loader.data_array;
    }
}