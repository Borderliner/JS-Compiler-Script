# JS-Compiler-Script<br>
A small Shell Script to compile all JS files in a folder using <a href="https://developers.google.com/closure/compiler/" target="_blank">Closure Compiler</a>.

###How Does It Work?<br>
First, make sure you have Closure Compiler installed. You should download it through your package manager, not the Java file. If you have the Java version, make sure it is accessible and is in your PATH EV, and can be run as <code>closure</code>, since this script uses <code>closure</code> as if it's a binary file.<br><br>

Then just put this file among all your JS files, and run:<br>
<code>./js_compile.sh</code><br><br>
It will take care of everything and generates x.jsc files.
It will aslo ignore files that contain ".min" or "-min", so you can use it safely.
