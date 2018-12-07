#!/usr/bin/env node

var exec = require('child_process').exec, child;
//console.log(process.cwd())
console.log(process.mainModule.paths[1])
var myscript = exec(process.mainModule.paths[1]+"/corber-react/corber.sh");
myscript.stdout.on("data",function(data){
    console.log(data); // process output will be displayed here
});
myscript.stderr.on("data",function(data){
    console.log(data); // process error output will be displayed here
});