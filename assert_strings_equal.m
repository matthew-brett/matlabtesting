function assert_strings_equal(s1, s2)
% Raise error if sets of strings s1, s2 differ
% FORMAT assert_strings_equal(s1, s2)
% Allow char and cell arrays to be compared without complaint

if ~iscell(s1), s1=cellstr(s1); end
if ~iscell(s2), s2=cellstr(s2); end
if ~all(size(s1)==size(s2))
  error('Compared string matrices different sizes');
end
if ~all(strcmp(s1, s2))
  error('Strings differ');
end
