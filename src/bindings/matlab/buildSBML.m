function buildSBML
% Builds the MATLAB language interface for libSBML.
%
% This script is meant to be invoked from libSBML's MATLAB bindings source
% directory.  LibSBML must already have been compiled and installed on your
% system.  This script makes the following assumptions:
%
% * Linux and Mac systems: the compiled libSBML library must be on the
%   appropriate library search paths, and/or the appropriate environment
%   variables must have been set so that programs such as MATLAB can load
%   the library dynamically.
%
% * Windows systems: the libSBML binaries (.dll and .lib files) and its
%   dependencies (such as the XML parser library being used) must be located
%   together in the same directory.  This script also assumes that libSBML
%   was configured to use the libxml2 XML parser library.  (This assumption
%   is under Windows only.)
%
% After this script is executed successfully, a second step is necessary
% to install the results.  This second step is performed by the "installSBML"
% script found in the same location as this script.
%
% (File $Revision$ of $Date::                              $

% Filename    : buildSBML.m
% Description : Build MATLAB binding.
% Author(s)   : SBML Team <sbml-team@caltech.edu>
% Organization: EMBL-EBI
% Created     : 2011-02-08
% Revision    : $Id$
% $HeadURL$
%
% This file is part of libSBML.  Please visit http://sbml.org for more
% information about SBML, and the latest version of libSBML.
%
% Copyright (C) 2009-2011 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. EMBL European Bioinformatics Institute (EBML-EBI), Hinxton, UK
%  
% Copyright (C) 2006-2008 by the California Institute of Technology,
%     Pasadena, CA, USA 
%  
% Copyright (C) 2002-2005 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. Japan Science and Technology Agency, Japan
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution
% and also available online as http://sbml.org/software/libsbml/license.html

  disp(sprintf('\nConstructing the libSBML MATLAB interface.\n'));

  [detected_os, matlab, root, bit64, writeAccess] = determine_system();

  switch detected_os
    case 0
      build_win(matlab, root, writeAccess, bit64);
    case 1
      build_mac(matlab, root, writeAccess);
    case 2
      build_linux(matlab, root, writeAccess);
    otherwise
      % This case will actually never be triggered because
      % determine_system() will invoke error() itself.
      error('OS not recognised');
  end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check what we are using
function [detected_os, matlab, root, bit64, writeAccess] = determine_system

  disp('Phase 1: preliminary checks of runtime environment ...');
  % matlab = [0, 1]
  %     0 - octave
  %     1 - matlab
  if (strcmp(isoctave(), '0'))
    matlab = 1;
    who_we_are = 'MATLAB';
    disp('- This appears to be MATLAB and not Octave.');
  else
    matlab = 0;
    who_we_are = 'Octave';
    disp('- This appears to be Octave and not MATLAB.');
  end;

  bit64 = 0;
  % detected_os = [0, 1, 2]
  %      0 - windows
  %      1 - mac
  %      2 - unix
  if (ispc())
    detected_os = 0;
    if (strcmp(computer(), 'PCWIN64') == 1)
      bit64 = 1;
      disp(sprintf('- %s reports the OS is Windows 64-bit.', who_we_are));
    else
      disp(sprintf('- %s reports the OS is Windows 32-bit.', who_we_are));
    end;
  elseif(ismac())
    detected_os = 1;
    disp(sprintf('- %s reports the OS is MacOS.', who_we_are));
  elseif(isunix())
    detected_os = 2;
    disp(sprintf('- %s reports the OS is Linux.', who_we_are));
  else
    message = sprintf('\n%s\n%s\n', ...
        'Unable to determine the type of operating system in use.', ...
        'Please contact libsbml-team@caltech.edu to help resolve this problem.');
    error(message);
  end;

  % THIS WILL BE octave/matlab dependant
  % need to check which directory we are in
  % if we are in the src directory we should 
  % be in directory ../src/bindings/matlab
  % if not we should not really be building !!
  [remain, first] = fileparts(pwd);
  [remain1, second] = fileparts(remain);
  [remain2, third] = fileparts(remain1);

  if (matlab == 1)
    if (~strcmp(first, 'matlab'))
	  report_incorrect_dir(pwd, '/src/bindings/matlab');
    elseif (~strcmp(second, 'bindings'))
	  report_incorrect_dir(pwd, '/src/bindings/matlab');
    elseif (~strcmp(third, 'src'))
	  report_incorrect_dir(pwd, '/src/bindings/matlab');
    else
	  root = remain2;
	  disp('- We are running from src/bindings/matlab as expected.');
    end;
  else
    if (~strcmp(first, 'octave'))
	  report_incorrect_dir(pwd, '/src/bindings/octave');
    elseif (~strcmp(second, 'bindings'))
	  report_incorrect_dir(pwd, '/src/bindings/octave');
    elseif (~strcmp(third, 'src'))
	  report_incorrect_dir(pwd, '/src/bindings/octave');
    else
	  root = remain2;
	  disp('- We are running from src/bindings/octave as expected.');
	end;
  end;

  % check whether we have write access to this directory
  writeAccess = 1;
  if (fopen('temp', 'w') == -1)
    writeAccess = 0;
  end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tell user we are in the wrong location
function report_incorrect_dir(this_dir, expected)

  message = sprintf('\n%s\n%s%s%s\n%s\n%s%s%s\n%s\n', ...
      'This script needs to be invoked from the libSBML subdirectory ', ...
      'ending in "', expected, '". However, it is being invoked', ...
      'from the directory', '   "', this_dir, '"', ...
      'instead.  Please change your working directory and re-run this script.');
  error(message);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build on windows
function build_win(ismatlab, root, writeAccess, bit64)

  disp('Phase 2: tests for libraries and other dependencies ...');
  % check that the win/bin directory exists
  bin_dir = [root, filesep, 'win', filesep, 'bin'];
  disp(sprintf('- Checking for the existence of the %s directory ...\n', bin_dir));
  if (exist(bin_dir, 'dir') ~= 7)
      disp(sprintf('%s directory could not be found\n\n%s\n%s %s', bin_dir, ... 
          'The build process assumes that the libsbml binaries', ...
          'exist at', bin_dir));
      message = sprintf('\n%s\n%s', ...
          'if they are in another directory please enter the ', ...
          'full path to reach the directory from this directory: ');
      new_bin_dir = input(message, 's');
        
      if (exist(new_bin_dir, 'dir') == 0)
          error('libraries could not be found');
      else
        bin_dir = new_bin_dir;
      end;
  end;

  disp('- Checking for the presence of needed libraries ...');
  if (bit64 == 0)
    % check that the library files are all there
    lib{1} = [bin_dir, filesep, 'libsbml.lib'];
    lib{2} = [bin_dir, filesep, 'libsbml.dll'];
    lib{3} = [bin_dir, filesep, 'libxml2.lib'];
    lib{4} = [bin_dir, filesep, 'libxml2.dll'];
    lib{5} = [bin_dir, filesep, 'iconv.lib'];
    lib{6} = [bin_dir, filesep, 'iconv.dll'];
    lib{7} = [bin_dir, filesep, 'bzip2.lib'];
    lib{8} = [bin_dir, filesep, 'bzip2.dll'];
  else
    % check that the library files are all there
    lib{1} = [bin_dir, filesep, 'libsbml.lib'];
    lib{2} = [bin_dir, filesep, 'libsbml.dll'];
    lib{3} = [bin_dir, filesep, 'libxml2.lib'];
    lib{4} = [bin_dir, filesep, 'libxml2.dll'];
    lib{5} = [bin_dir, filesep, 'libiconv.lib'];
    lib{6} = [bin_dir, filesep, 'libiconv.dll'];
    lib{7} = [bin_dir, filesep, 'bzip2.lib'];
    lib{8} = [bin_dir, filesep, 'libbz2.dll'];
  end;

  found = 1;
  for i = 1:8
    if (exist(lib{i}) ~= 0)
      disp(sprintf('%s found', lib{i}));
    else
      disp(sprintf('%s not found', lib{i}));
      found = 0;
    end;
  end; 

  if (found == 0)
    error (sprintf('Not all dependencies could be found\n%s%s', ...
    'expected the dependencies to be in ', bin_dir));
  else
    disp('- All dependencies found.  Good.');
  end;
  
  % check that the include directory exists
  include_dir = [root, filesep, 'include'];
  disp(sprintf('- Checking for the existence of the %s directory ...\n', include_dir));
  if (exist(include_dir, 'dir') ~= 7)
      disp(sprintf('%s directory could not be found\n\n%s\n%s %s', include_dir, ... 
          'The build process assumes that the libsbml include files', ...
          'exist at', include_dir));
      message = sprintf('\n%s\n%s', ...
          'if they are in another directory please enter the ', ...
          'full path to reach the directory from this directory: ');
      new_inc_dir = input(message, 's');
        
      if (exist(new_inc_dir, 'dir') == 0)
          error('include files could not be found');
      else
        include_dir = new_inc_dir;
      end;
  end;
  
  % if we do not have write access need to find somewhere else to build
  if (writeAccess == 0)% must be 0; 1 is for testing
    % create a new dir in the users path
    this_dir = pwd;
	  if (ismatlab)
      user_dir = userpath;
      user_dir = user_dir(1:length(user_dir)-1);
    else
	    user_dir = matlabroot;
	  end;
    disp(sprintf('- Copying library files to %s ...', user_dir)); 
    if (copyLibraries(this_dir, user_dir, lib) == 1)
      disp('- Copying of library files successful.');
    else
      error('Cannot copy library files on this system');
    end;
    disp(sprintf('- Copying MATLAB binding files to %s ...', user_dir)); 
    if (copyMatlabDir(this_dir, user_dir) == 1)
      disp('- Copying of MATLAB binding files successful');
    else
      error('Cannot copy matlab binding files on this system');
    end;
  else
    this_dir = pwd;
    user_dir = pwd;
    % copy the library files to here
    disp(sprintf('- Copying library files to %s ...', user_dir)); 
    if (copyLibraries(this_dir, user_dir, lib) == 1)
      disp('- Copying of library files successful');
    else
      error('Cannot copy library files on this system');
    end;
    
  end; 
    
  % build the files
  inc_flag = ['-I', include_dir];
  buildMexFiles(inc_flag, lib{1}, ismatlab, 0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build on mac
function build_mac(ismatlab, root, writeAccess)

  disp('Phase 2: tests for libraries and other dependencies ...');

  % check that libsbml is in usr/local/lib directory
  bin_dir = [];

  for i=1:length(strfind(pwd, filesep))
      bin_dir = [bin_dir, '..', filesep];
  end;
  bin_dir = [bin_dir, 'usr', filesep, 'local', filesep, 'lib'];
  disp('- Checking for the presence of needed libraries ...');
  % check that the library files are all there
  lib{1} = [bin_dir, filesep, 'libsbml.dylib'];
  if (exist(lib{1}) == 0)
      disp('libsbml.dylib could not be found');
      new_bin_dir = input(sprintf('\n\n%s\n%s\n%s\n%s', ...
          'The build process assumes that libsbml', ...
          'has been installed at usr/local', ...
          'if libsbml.dylib is in another directory please enter the ', ...
          'full path to reach the directory from this directory: '), 's');
      lib{2} = [new_bin_dir, filesep, 'libsbml.dylib'];
      
      if (exist(lib{2}) == 0)
          error('libsbml.dylib could not be found');
      else
        lib{1} = lib{2};
      end;
  end;
  
  % check that the include directory exists
  include_dir = [root, filesep, 'include'];
  disp(sprintf('- Checking for the existence of the %s directory ...', include_dir));
  if (exist(include_dir, 'dir') ~= 7)
    error (sprintf('%s not found\n%s', include_dir, ...
      'the libSBML source tree expects this directory to exist'));
  end;
  
  if (writeAccess == 0)% must be 0; 1 is for testing
    % create a new dir in the users path
    this_dir = pwd;
	  if (ismatlab)
      user_dir = userpath;
      user_dir = user_dir(1:length(user_dir)-1);
    else
	    user_dir = matlabroot;
	  end;
    disp(sprintf('- Copying MATLAB binding files to %s ...', user_dir)); 
    if (copyMatlabDir(this_dir, user_dir) == 1)
      disp('- Copying of MATLAB binding files successful.');
    else
      error('Cannot copy matlab binding files on this system');
    end;
  end;
  
  % build the files
  inc_flag = ['-I', include_dir];
  library = ['-L', lib{1}];
  buildMexFiles(inc_flag, library, ismatlab, 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build on linux
function build_linux(ismatlab, root, writeAccess)

  disp('Phase 2: tests for libraries and other dependencies ...');

  % check that libsbml is in usr/local/lib directory
  bin_dir = [];

  for i=1:length(strfind(pwd, filesep))
      bin_dir = [bin_dir, '..', filesep];
  end;
  bin_dir = [bin_dir, 'usr', filesep, 'local', filesep, 'lib'];
  disp('- Checking for the presence of needed libraries ...');
  % check that the library files are all there
  lib{1} = [bin_dir, filesep, 'libsbml.so'];
  if (exist(lib{1}) == 0)
      disp('- libsbml.so could not be found');
      new_bin_dir = input(sprintf('\n\n%s\n%s\n%s\n%s', ...
          'The build process assumes that libsbml', ...
          'has been installed at usr/local', ...
          'if libsbml.so is in another directory please enter the ', ...
          'full path to reach the directory from this directory: '), 's');
      lib{2} = [new_bin_dir, filesep, 'libsbml.so'];
      
      if (exist(lib{2}) == 0)
          error('libsbml.so could not be found');
      else
        lib{1} = lib{2};
      end;
  end;
  
  % check that the include directory exists
  include_dir = [root, filesep, 'include'];
  disp(sprintf('- Checking for the existence of the %s directory ...', include_dir));
  if (exist(include_dir, 'dir') ~= 7)
    error (sprintf('%s not found\n%s', include_dir, ...
      'the libSBML source tree expects this directory to exist'));
  end;
  
  if (writeAccess == 0)% must be 0; 1 is for testing
    % create a new dir in the users path
    this_dir = pwd;
	  if (ismatlab)
      user_dir = userpath;
      user_dir = user_dir(1:length(user_dir)-1);
    else
	    user_dir = matlabroot;
	  end;
    disp(sprintf('- Copying MATLAB binding files to %s ...', user_dir)); 
    if (copyMatlabDir(this_dir, user_dir) == 1)
      disp('- Copying of MATLAB binding files successful.');
    else
      error('Cannot copy matlab binding files on this system');
    end;
  end;

  % build the files
  inc_flag = ['-I', include_dir];
  library = ['-L', lib{1}];
  buildMexFiles(inc_flag, library, ismatlab, 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% runs the mex command for windows and matlab
% the messy file handle stuff is because this seems to be the best way to 
% be able to pass arguments to the function
function buildMexFiles(include, library, ismatlab, notwin)

  disp('Phase 3: building the actual interface ...');

  if (ismatlab == 1)
	fhandle = @mex;
	disp('- Building TranslateSBML ...');
    if (notwin)
      feval(fhandle, 'TranslateSBML.c', include, library, '-lsbml');
    else
	  feval(fhandle, 'TranslateSBML.c', include, library);
    end;
	disp('- Building OutputSBML ...');
    if (notwin)
      feval(fhandle, 'OutputSBML.c', include, library, '-lsbml');
    else
	  feval(fhandle, 'OutputSBML.c', include, library);
    end;
  else
 	fhandle = @mkoctfile;
	disp('- Building TranslateSBML ...');
  if (notwin)
    feval(fhandle, '--mex', 'TranslateSBML.c', '-DUSE_OCTAVE', include, '-lbz2', '-lz', library, '-lsbml');
  else
    feval(fhandle, '--mex', 'TranslateSBML.c', '-DUSE_OCTAVE', include, '-lbz2', '-lz', library);
  end;
	disp('- Building OutputSBML ...');
  if (notwin)
    feval(fhandle, '--mex', 'OutputSBML.c', '-DUSE_OCTAVE', include, '-lbz2', '-lz', library, '-lsbml');
  else
    feval(fhandle, '--mex', 'OutputSBML.c', '-DUSE_OCTAVE', include, '-lbz2', '-lz', library);
  end;
%   mkoctfile --mex TranslateSBML.c -DUSE_OCTAVE include -lbz2 -lz library;
  end;

  transFile = strcat('TranslateSBML.', mexext());
  outFile = strcat('OutputSBML.', mexext());

  if ((exist(transFile) ~= 0 && ...
      exist(outFile) ~= 0))      
    disp(sprintf('%s\n\n%s\n', 'Build successful.', ...
      'Now please run the "installSBML" script to install and test the files just built.'));
  else
    error('Build failed.');
  end;

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % creates a copy of the matlab binding directory with tests
  function copied = copyMatlabDir(orig_dir, target_dir)
    
    copied = 0;
    cd (target_dir);
    % create libsbml dir
    if (exist('libsbml', 'dir') == 0)
      mkdir('libsbml');
    end;
    cd libsbml;
    new_dir = pwd;

    %copy files to libsbml
    cd(orig_dir);
    copyfile('TranslateSBML.c', new_dir);
    copyfile('OutputSBML.c', new_dir);
    copyfile('*.m', new_dir);
    copyfile('*.xml', new_dir);
    cd(new_dir);
%     delete ('buildLibSBML.m');
    
    % create test dir
    testdir = fullfile(pwd, 'test');
    if (exist(testdir, 'dir') == 0)
      mkdir('test');
    end;
    cd('test');
    new_dir = pwd;
    
    %copy test files
    cd(orig_dir);
    cd('test');
    copyfile('*.m', new_dir);
    
    % create test-data dir
    cd(new_dir);
    testdir = fullfile(pwd, 'test-data');
    if (exist(testdir, 'dir') == 0)
      mkdir('test-data');
    end;
    cd('test-data');
    new_dir = pwd;
    
    %copy test-data files
    cd(orig_dir);
    cd ('test');
    cd ('test-data');
    copyfile('*.xml', new_dir);
    
    %navigate to new libsbml directory
    cd(new_dir);
    cd ..;
    cd ..;
    
    % put in some tests here
    copied = 1;

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% copies the library files to given directory
function copied = copyLibraries(orig_dir, target_dir, lib)
  
  copied = 0;
  cd (target_dir);
  
  % if we moving to another location create a libsbml directory
  % if we are staying in src/matlab/bindings copy here
  if (~strcmp(orig_dir, target_dir))
    if (exist('libsbml', 'dir') == 0)
      mkdir('libsbml');
    end;
    cd libsbml;
  end;
  new_dir = pwd;
  % copy the necessary files
  for i = 1:8
    copyfile(lib{i}, new_dir);
  end;
  cd(orig_dir);
  
  copied = 1;
