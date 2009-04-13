function tests = find_tests(test_directory, test_prefix)
% Find cases in specified directory
if nargin < 2
  test_prefix = '';
end
if isempty(test_prefix)
  test_prefix = 'test_';
end
mfiles = what(test_directory);
tests = mfiles.m(strmatch(test_prefix, mfiles.m));
for i = 1:length(tests)
  test = tests{i};
  [p f e] = fileparts(test);
  tests{i} = f;
end
return
