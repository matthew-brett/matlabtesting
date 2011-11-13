function assert_equal(m1, m2, tol)
% Raises error if m1, m2 not numerically close with threshold tol
% FORMAT assert_equal(m1, m2, tol)
% m1, m2 can be numeric or cell arrays
% NaNs are allowed and have to be in the same location in each array

if nargin < 3
  tol = 0;
end

if isempty(m1)
  if ~isempty(m2)
    error('Comparison of empty to not-empty');
  end
  return
end
if ~all(size(m1)==size(m2))
  error('Compared matrices different sizes');
end

if ~iscell(m1), m1={m1}; end
if ~iscell(m2), m2={m2}; end

for e = 1:numel(m1)
  c1 = m1{e};
  c2 = m2{e};
  if isempty(c1)
    if ~isempty(c2)
      error('Comparison of empty to not-empty');
    end
    continue
  end
  % NaNs can occur, but must be in the same place
  nan1 = isnan(c1);
  if any(nan1 ~= isnan(c2))
      error('NaNs positions do not match in compared arrays');
  end
  D = abs(c1 - c2);
  if any(D(~nan1) > tol)
    error(['Matrices differ at tol ' num2str(tol)]);
  end
end
return
