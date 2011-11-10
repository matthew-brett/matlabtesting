function assert_true(test1)
% Raise an error if test1 is not true
if ~test1
  error('Assertion failed');
end
return
