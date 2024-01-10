package;

class Big {
    public function new(sizemin, sizemax) {
        var size = sizemin + Std.random(sizemax - sizemin);

        for(i in 0...size) {
            arr.push(1);
        }
    }
    var arr = [];
    var arr2 = new haxe.ds.Vector(10000001);
}

class Obj {
    public var value:Int;
    public function new() {
        value = Std.random(10);

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
    var dummy9 = new haxe.ds.Vector(20);

    public function process(a:Array<Obj>) {
        var size = 100;

        for(k in 0...size) {
            var i = Std.random(size);
            a[i] = new Obj();
        }

        for(k in 0...Std.int(size/10)) {
            var j = Std.random(size);
            a[j] = null;
        }
    }
}

typedef A = Obj;
typedef B = Obj;

class Main {

    function saveStates(): Array< {a: A, b: B, buffed: Float, oldCd: Float}> {
        var savedStates: Array<{a: A, b: B, buffed: Float, oldCd: Float}> = [];

        var randomObj: Array<Obj> = [];

        for(i in 0...10) {
            randomObj.push(new Obj());
        }

        for(i in 0...10) {
            if(Std.random(10) < 5) {
                savedStates.push({a: new A(), b: new B(), buffed: Math.random(), oldCd: 1.0});
            }
        }

        return savedStates;
    }

    function analyze(items:Array< {a: A, b: B, buffed: Float, oldCd: Float}>) {
        trace("analyze");
        for(item in  items) {
            trace(item.buffed);
        }
    }

    var current:Big;

    var noiseArr = [];

    function noise() {
        trace("noise");
        for(i in 0...100) {
            var arr:Array<Obj> = [];
            var obj = new Obj();
            obj.process(arr);
            noiseArr[Std.random(1000)] = obj;
        }
    }

    function process() {
        noise();
        var states = saveStates();
        var all = [];


        trace("bigalloc");
        for(i in 0...5) {
            var obj = new Big(10, 10);
            all.push(obj);
            current = obj;
            all[Std.random(10)] = null;
        }

        all = [];
        noise();
        noise();

        analyze(states);
    }

    function new() {
        for(n in 0...1000000) {
            process();
        }
    }

    static function main() {
        new Main();
    }

}
