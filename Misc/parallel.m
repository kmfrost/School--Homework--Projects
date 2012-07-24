function R = parallel(varargin)
n   = nargin;
a   = ones(1,n);
for i=[1:nargin]
    a(i) = varargin{i};
end
R   = 1/sum(1./a(1,1:n));
