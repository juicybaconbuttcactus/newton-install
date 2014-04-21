#The Newton Build System

##How to Use
1. First, install the necessary manual modules. This includes all of the modules listed below.

2. Next, set the environment variable `INSTALLDIR` to the top-level directory where you want your applications installed.

3. Some modules have to explicitly link to the MKL, and they use the `INSTALLDIR` environment variable to do this.
   Make sure you have your intel compilers installed in `$INSTALLDIR/intel/2011.5.220` or whichever version you use.

4. Set the environment variable `MODULEDIR`, which tells the script where to put the modulefiles. 
   Make sure this is inside a working Modules installation, because the build scripts use modules to load the necessary 
   libraries and dependencies as they build applications.  
   If you do not set this variable, the script will complain about it, and many builds will fail.

4. Now, run the script `newton_install_all.pl` and wait for the applications to be installed.

5. The program will output on `stdout` as it installs modulefiles into the proper directory. 
   If it says that an application is a `NON-MODULE`, that means that the modulefile could not be found.
   Usually this means that the application is simply a Perl or Python library that does not need the module system, 
   but you should check each of these to make sure there are no errors with your modulefiles.

##Modules to Install First
These modules are required for you to install before you run the install script, unless you want things to fail.
Oftentimes, they are directly referenced in the install scripts via a line like `module load intel-compilers/2011.5.220`; therefore,
if you no longer have the versions of the intel compilers that these scripts reference, you will have to change them yourself.

Of course, if you are not going to install, for example, magma, which is the only application that requires cuda, then the script
will not check for cuda, and you therefore do not have to install it.

Make sure that the modulefiles are in the correct place and can be loaded; else, the builds will fail and you will have to start over.

1. intel-compilers/2011.5.220
2. intel-compilers/2013.1
3. cuda/4.2

##How it Works
The script simply looks at the current directory, and loops through each of the `newton_*.sh` scripts. 
Each file that matches this pattern gets copied into the directory `buildir`, where the files in the corresponding tar file 
get copied.  Each of these build scripts checks the environment variable `INSTALLDIR` and installs the application to 
`$INSTALLDIR/name/version` where name and version are the name and version of the application being built.

Then, after building an application, it will copy the appropriate modulefile from the `modulefiles` directory, assuming that you have
your Modules system installed in `$MODULEDIR`.

The script then checks the return code of each of the build scripts in order to determine if they succeeded or not, and 
prints out a statment of failure or success depending on that value (0 is success, nonzero is failure).

In order for it to work, there must be multiple directories in the same directory as the script:
  1. `scripts`, which is the directory where you put all of the newton_name_version.sh installation scripts.
  2. `tarballs`, which is where the corresponding newton_name_version directories are. These directories contain the files necessary
     to compile the application, and must be named exactly the same as the matching newton_name_version.sh script.
  3. `buildir`, which is where the script will copy the `tarballs` and `scripts` in order to install the applications.
  4. `modulefiles`, which is where the script will pull the modulefiles from. These are in exactly the same format that they will
     appear in the module system, but their version and name must match the names in `scripts` and `tarballs` exactly.
  5. `manual`, which is not required by the script, but where the applications that must be built manually will go.
  6. `backup`, which is also not required by the script. This contains backups of all of the `tarballs`, unchanged.
