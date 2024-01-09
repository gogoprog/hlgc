package;

class Obj {
    public var value:Int;
    public function new() {
        value = Std.random(10);
    }

    var dummy = [];
    var dummy2 = [];
    var dummy3 = [];
    var dummy4 = [];
    var dummy5 = [];
    var dummy6 = [];
    var dummy7 = [];
    var dummy8 = [];
    var dummy9 = [];
}

class Main {

    static function main() {
        trace("Hello");

        for(n in 0...1000000) {
            var a:Array<Obj> = [];


            for(k in 0...10000) {
                var i = Std.random(10000);
                a[i] = new Obj();
            }

            var r = a[Std.random(10000)];
            var exists = (r != null);

            for(k in 0...100) {
                var j = Std.random(10000);
                a[j] = null;
            }

            if(r != null) {
                trace(r.value);
            }
        }
    }

}
