function D = get_searching_set(n, options)
%GET_SEARCHING_SET generates the set of polling directions.
%
%   D = GET_SEARCHING_SET(N) generates the set of polling directions
%   {e_1, ..., e_n, -e_1,..., -e_n}, represented in matrix format.
%
%   D = GET_SEARCHING_SET(N, OPTIONS) allows to supply options to the set
%   generation. Set OPTIONS.direction to "canonical" to obtain
%   {e_1, -e_1, ..., e_n, -e_n}, represented in matrix format.

% Set options to an empty structure if it is not supplied.
if nargin < 2
    options = struct();
end

% Compute the polling directions.
% Set default searching set.
D = [eye(n) -eye(n)];

if isfield(options, "direction") && options.direction == "canonical"
    % Remark: the code below could be improved but it is simple and works,
    % so why bother for the moment.
    perm = zeros(2*n, 1);
    perm(1:2:2*n-1) = 1:n;
    perm(2:2:2*n) = n+1:2*n;
    D = D(:, perm);
end

end
