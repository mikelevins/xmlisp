# Windows Issues: #
> ## Example Specific Issues: ##
> > ### Game of Life: ###
> > In this example we get some drawing artifacts the second time the example is opened.  When you first load the example everything, is fine, but if you were to execute all the code a second time, the example will load with strange horizontal grey lines.
> > ### Circle: ###
> > In this example we get some drawing artifacts the second time the example is opened.  When you first load the example everything, is fine, but if you were to execute all the code a second time, the example will load with strange horizontal grey lines.
> > ### GLSL OpenGL Blue Shader: ###
> > In this example we get some drawing artifacts the second time the example is opened.  When you first load the example everything, is fine, but if you were to execute all the code a second time, the example will load with strange horizontal grey lines.
> > ### Who is Talking: ###
> > Cocoa's speach synthesis is not supported on the PC so instead of the objects speaking with voice synthesis their speech is forwarded to the console.
> > ### Full Screen Support: ###
> > Cocoa's full screen view methods do not work with Cocotron so the switch to full screen button will do nothing on Windows.

> ## General Issues: ##
> > ### 3D Performance: ###
> > In general, openGL performance is worse on the Windows version of XMLISP.  Most of the examples will report lower frame rates when run on Windows instead of Mac on the same hardware.  More specifically, examples that are simpler (less agents) will report much worse frame rates on Windows, while examples that are more complicated (more agents) will report much more similar frame rates on OSX and Windows.
> > ### Resizing Windows: ###
> > Resizing windows can be very problematic on the Windows version of XMLISP.  There are still some threading issues with Cocotron that can cause XMLISP to crash when you resize any of the Windows.
> > ### Exit Errors: ###
> > Sometimes when you close the listener the console will report an error.  Most of the time the console will just instruct you to press any ket to exit, but sometimes you will get a hard  crash and a register dump.  If the hard crash occurs you can try to type :q to quit but you may have to execute an "End Task" on the XMLISP process.
> > ### File Chooser Can Cause Crash: ###
> > Sometimes XMLISP Windows will crash after trying to open a file with the file chooser.  This normally only happens after the user has executed an example (this has a similar cause to the window resizing issue and is also related to some operations that are not thread safe in Cocotron).