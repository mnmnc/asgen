asgen
=====

Automatic Startup Generator

This is a script written as an answer to a particular Superuser.com question. Exactly [this question](http://superuser.com/questions/784831/start-windows-with-previously-open-programs).

### The actions performed:

* Delete previous file.
* Check the running processes.
* Filter the list by path that contains specific word (Program) which assumes all programs are installed either in Program Files or Program files(x86)
* Get the absolute paths to executables of processes that were found
* Write paths to temp file in temp directory.
* Move temp file to destination directory that is to Startup folder of user.

### Pros:

* Written in powershell so the code is native and should work in Windows Vista and above.
* Works.

### Cons:

* Programs installed in another path - not under program files - will not get picked up in this version. That is of course necessary to avoid starting native Windows processes like explorer.exe and so on. However if you have a path like D:\Apps where you also install programs, you can modify the line

    ```$_.Path -match "Program"```

    to

   ```$.Path -match "Program" -or $.Path -match "D:\Apps"```

    and it will work all the same.

***
In case you have an error when executing the script you probably have incorrect setting for Execution policy for powershell. To change that you have to open powershell console as administrator and type in `Set-ExecutionPolicy Unrestricted` and type in `Y` when asked to confirm. That's it. Should work fine.
