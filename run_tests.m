function run_tests(test_directory, test_prefix)
% Run test cases in specified directory or pwd by default
cwd = pwd;
if nargin < 1
  test_directory = cwd;
end
if nargin < 2
  test_prefix = [];
end
tests = find_tests(test_directory, test_prefix);
if isempty(tests)
  warning(['Found no tests in ' test_directory]);
  return
end
cd(test_directory);
try
  for ti = 1:length(tests)
    test = tests{ti};
    fprintf('Running %s...\n', test);
    eval([test ';']);
  end
catch
  cd(cwd);
  ple;
  rethrow(lasterror);
end
cd(cwd);
return
