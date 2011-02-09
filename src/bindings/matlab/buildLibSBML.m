function buildLibSBML
% builds the libsbml - matlab binding
% This script assumes that libsbml has been built and installed on your system.
%
% For Linux or Mac users this means that the libsbml library must be on
% the library path for your system.
%
% For windows users this means that libsbml must be built and the binaries (.dll
% and .lib files) for libsbml and all its dependencies must be located together
% in one directory. The build assumes libxml2 is the xml parser to be used.

% Filename    : buildLibSBML.m
% Description : build matlab binding
% Author(s)   : SBML Team <sbml-team@caltech.edu>
% Organization: EMBL-EBI
% Created     : 2011-02-08
% Revision    : $Id:  $
% $HeadURL:  $
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
%

  [detected_os, matlab, root, bit64, writeAccess] = determine_system();

  switch detected_os
    case 0
      disp(sprintf('%s\n\n%s\n\n%s\n', ...
        '***********************************************************************', ...
        'NOTE: libsbml must be built prior to running this script', ...
        '***********************************************************************'));
      build_win(matlab, root, writeAccess, bit64);
    case 1
      disp(sprintf('%s\n\n%s\n\n%s\n', ...
        '***********************************************************************', ...
        'NOTE: libsbml must be built and installed prior to running this script', ...
        '***********************************************************************'));
      build_mac(matlab, root);
    case 2
      disp(sprintf('%s\n\n%s\n\n%s\n', ...
        '***********************************************************************', ...
        'NOTE: libsbml must be built and installed prior to running this script', ...
        '***********************************************************************'));
      build_linux(matlab, root);
    otherwise
      error('OS not recognised');
  end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check what we are using
function [detected_os, matlab, root, bit64, writeAccess] = determine_system

  disp('Checking system ...');
  disp('Looking at software ...');
  % matlab = [0, 1]
  %     0 - octave
  %     1 - matlab
  if (strcmp(isoctave(), '0'))
    matlab = 1;
    disp('MATLAB detected');
  else
    matlab = 0;
    disp('Octave detected');
  end;

  disp('Looking at OS ...');
  bit64 = 0;
  % detected_os = [0, 1, 2]
  %      0 - windows
  %      1 - mac
  %      2 - unix
  if (ispc())
    detected_os = 0;
    if (strcmp(computer(), 'PCWIN64') == 1)
      bit64 = 1;
      disp('Windows 64 bit OS detected');
    else
      disp('Windows 32 bit OS detected');
    end;
  elseif(ismac())
    detected_os = 1;
    disp('Mac OS detected');
  elseif(isunix())
    detected_os = 2;
    disp('Linux OS detected');
  else
    error('Unable to establish operating system');
  end;

  disp('Checking directory structure ...');
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
	  disp('Expected directory structure found');
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
	  disp('Expected directory structure found');
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

  message = sprintf('You are in directory %s \nbut should be in %s', this_dir, expected);
  error(message);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build on windows
function build_win(ismatlab, root, writeAccess, bit64)

  % check that the win/bin directory exists
  bin_dir = [root, filesep, 'win', filesep, 'bin'];
  disp(sprintf('Checking for the %s directory ...\n', bin_dir));
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

  disp('Checking for libraries ...');
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
    disp('All dependencies found');
  end;
  
  % check that the include directory exists
  include_dir = [root, filesep, 'include'];
  disp(sprintf('Checking for the %s directory ...\n', include_dir));
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
    disp(sprintf('Copying library files to %s ...', user_dir)); 
    if (copyLibraries(this_dir, user_dir, lib) == 1)
      disp('Copy library files successful');
    else
      error('Cannot copy library files on this system');
    end;
    disp(sprintf('Copying matlab binding files to %s ...', user_dir)); 
    if (copyMatlabDir(this_dir, user_dir) == 1)
      disp('Copy matlab binding files successful');
    else
      error('Cannot copy matlab binding files on this system');
    end;
  else
    this_dir = pwd;
    user_dir = pwd;
    % copy the library files to here
    disp(sprintf('Copying library files to %s ...', user_dir)); 
    if (copyLibraries(this_dir, user_dir, lib) == 1)
      disp('Copy library files successful');
    else
      error('Cannot copy library files on this system');
    end;
    
  end; 
    
  % build the files
  inc_flag = ['-I', include_dir];
  buildMexFiles(inc_flag, lib{1}, ismatlab);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build on mac
function build_mac(ismatlab, root)

  % check that libsbml is in usr/local/lib directory
  bin_dir = [];

  for i=1:length(strfind(pwd, filesep))
      bin_dir = [bin_dir, '..', filesep];
  end;
  bin_dir = [bin_dir, 'usr', filesep, 'local', filesep, 'lib'];
  disp('Checking for libraries ...');
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
  disp(sprintf('Checking for the %s directory ...', include_dir));
  if (exist(include_dir, 'dir') ~= 7)
    error (sprintf('%s not found\n%s', include_dir, ...
      'the libSBML source tree expects this directory to exist'));
  end;
  
  % build the files
  inc_flag = ['-I', include_dir];
  buildMexFiles(inc_flag, lib{1}, ismatlab);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build on linux
function build_linux(ismatlab, root)

  % check that libsbml is in usr/local/lib directory
  bin_dir = [];

  for i=1:length(strfind(pwd, filesep))
      bin_dir = [bin_dir, '..', filesep];
  end;
  bin_dir = [bin_dir, 'usr', filesep, 'local', filesep, 'lib'];
  disp('Checking for libraries ...');
  % check that the library files are all there
  lib{1} = [bin_dir, filesep, 'libsbml.so'];
  if (exist(lib{1}) == 0)
      disp('libsbml.so could not be found');
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
  disp(sprintf('Checking for the %s directory ...', include_dir));
  if (exist(include_dir, 'dir') ~= 7)
    error (sprintf('%s not found\n%s', include_dir, ...
      'the libSBML source tree expects this directory to exist'));
  end;
  
  % build the files
  inc_flag = ['-I', include_dir];
  buildMexFiles(inc_flag, lib{1}, ismatlab);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% runs the mex command for windows and matlab
% the messy file handle stuff is because this seems to be the best way to 
% be able to pass arguments to the function
function buildMexFiles(include, library, ismatlab)

  if (ismatlab == 1)
	fhandle = @mex;
	disp('Building TranslateSBML ...');
	feval(fhandle, 'TranslateSBML.c', include, library);
	disp('Building OutputSBML ...');
	feval(fhandle, 'OutputSBML.c', include, library);
  else
 	fhandle = @mkoctfile;
	disp('Building TranslateSBML ...');
	feval(fhandle, '--mex', 'TranslateSBML.c', '-DUSE_OCTAVE', include, '-lbz2', '-lz', library);
	disp('Building OutputSBML ...');
	feval(fhandle, '--mex', 'OutputSBML.c', '-DUSE_OCTAVE', include, '-lbz2', '-lz', library);
%   mkoctfile --mex TranslateSBML.c -DUSE_OCTAVE include -lbz2 -lz library;
  end;

  transFile = strcat('TranslateSBML.', mexext());
  outFile = strcat('OutputSBML.', mexext());

  if ((exist(transFile) ~= 0 && ...
      exist(outFile) ~= 0))      
    disp(sprintf('%s\n%s', 'Build successful', ...
      'Now run the install script which will install and test the files'));
  else
    disp('Build failed');
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
  
  
    
  
