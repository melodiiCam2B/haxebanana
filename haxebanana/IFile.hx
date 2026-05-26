package;
/**
 * data structure class for GameBanana API's _aFiles cells
 */
class IFile {
    public var v:String;
    public var file:String;
    public var id:Int;
    public var desc:String;
    public var avr:String;
    public var empty:Bool;
    public var archive:Bool;

    public var raw_data:Dynamic;
    public function new(raw_data:Dynamic) {
        this.raw_data = raw_data;

        v = raw_data._sVersion;
        file = raw_data._sFile;
        avr = raw_data._sAvResult;
        id = raw_data._idRow;
        desc = raw_data._sDescription;
        empty = !raw_data._bHasContents;
        archive = raw_data._bIsArchived;
    }
}