function test_find_tests;
% Test function for test finder
mfp = mfilename('fullpath');
[p f e] = fileparts(mfp);
tests = find_tests(p);
assert_strings_equal(tests, f);
