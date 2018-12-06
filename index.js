var exec = require('child_process').exec, child;

var myscript = exec("./corber.sh");
myscript.stdout.on("data",function(data){
    console.log(data); // process output will be displayed here
});
myscript.stderr.on("data",function(data){
    console.log(data); // process error output will be displayed here
});