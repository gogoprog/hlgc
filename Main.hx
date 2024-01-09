package;

class Obj {
    public var value:Int;
    public function new() {
        value = Std.random(10000);

        for(i in 0...value) {
            dummy.push(1);
        }
    }

    var dummy = [];
    var dummy2 = [];
    var dummy3 = [];
    var dummy4 = [];
    var dummy5 = [];
    var dummy6 = [];
    var dummy7 = [];
    var dummy8 = [];
    var dummy9 = new haxe.ds.Vector(20000);

    public function process(a:Array<Obj>, b:Obj) {
        var size = 100;

        for(k in 0...size) {
            var i = Std.random(size);
            a[i] = new Obj();
        }

        for(k in 0...Std.int(size/10)) {
            var j = Std.random(size);
            a[j] = null;
        }

        trace(b.value);
    }
}

class Main {

    static function main() {
        trace("Hello");

        for(n in 0...1000000) {
            var size = 100;
            var a:Array<Obj> = [];

            for(k in 0...size) {
                var j = Std.random(size);
                a[j] = new Obj();
            }

            var r = a[Std.random(size)];
            var r2 = a[Std.random(size)];

            if(r != null && r2 != null) {
                r.process(a, r2);
            }
        }
    }

}
