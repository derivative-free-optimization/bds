function tests = unit_test
%   UNIT_TEST runs all the test functions in this file.
%   To run these tests, simply type "Run Tests" in the command window.
%   To create a new test function in this file with a name that starts or
%   finishes with "test" (case insensitive). For more info, see
%
%   https://www.mathworks.com/help/matlab/matlab_prog/write-simple-test-case-with-functions.html

tests = functiontests(localfunctions);

end

function cycling_test(testCase)
%CYCLING_TEST tests the file private/cycling.m

% The following must not cycle the array.
array = [1, 2, 3, 4, 5];
for strategy = 0:4
    verifyEqual(testCase, cycling(array, -1, strategy), array)
end
for index = 1:length(array)
    verifyEqual(testCase, cycling(array, index, 0), array)
end

% The following are the ones commented on cycling.m.
array = [1, 2, 3, 4, 5];
verifyEqual(testCase, cycling(array, 3, 0), [1, 2, 3, 4, 5])
verifyEqual(testCase, cycling(array, 3, 1), [3, 1, 2, 4, 5])
verifyEqual(testCase, cycling(array, 3, 2), [3, 4, 5, 1, 2])
verifyEqual(testCase, cycling(array, 3, 3), [4, 5, 1, 2, 3])

array = [2, 1, 4, 5, 3];
verifyEqual(testCase, cycling(array, 3, 0), [2, 1, 4, 5, 3])
verifyEqual(testCase, cycling(array, 3, 1), [4, 2, 1, 5, 3])
verifyEqual(testCase, cycling(array, 3, 2), [4, 5, 3, 2, 1])
verifyEqual(testCase, cycling(array, 3, 3), [5, 3, 2, 1, 4])

end

function divide_direction_set_test(testCase)
%DIVIDE_direction_set_TEST tests the file private/divide_direction_set.m
n = 11;
nb = 3;
INDEX_direction_set = cell(1,nb);
INDEX_direction_set{1} = [1 2 3 4 5 6 7 8];
INDEX_direction_set{2} = [9 10 11 12 13 14 15 16];
INDEX_direction_set{3} = [17 18 19 20 21 22];

verifyEqual(testCase, divide_direction_set(n, nb), INDEX_direction_set)

n = 10;
nb = 3;
INDEX_direction_set = cell(1,nb);
INDEX_direction_set{1} = [1 2 3 4 5 6 7 8];
INDEX_direction_set{2} = [9 10 11 12 13 14];
INDEX_direction_set{3} = [15 16 17 18 19 20];

verifyEqual(testCase, divide_direction_set(n, nb), INDEX_direction_set)

n = 15;
nb = 3;
INDEX_direction_set = cell(1,nb);
INDEX_direction_set{1} = [1 2 3 4 5 6 7 8 9 10];
INDEX_direction_set{2} = [11 12 13 14 15 16 17 18 19 20];
INDEX_direction_set{3} = [21 22 23 24 25 26 27 28 29 30];

verifyEqual(testCase, divide_direction_set(n, nb), INDEX_direction_set)

n = 3;
nb = 3;
INDEX_direction_set = cell(1,nb);
INDEX_direction_set{1} = [1 2];
INDEX_direction_set{2} = [3 4];
INDEX_direction_set{3} = [5 6];

verifyEqual(testCase, divide_direction_set(n, nb), INDEX_direction_set)

end

function output = eval_fun_tmp(x)
if length(x) <= 100
    output = NaN;
elseif length(x) <= 200
    output = inf;
else
    error('The length of x is too large.');
end
end

function eval_fun_test(testCase)
%EVAL_fun_TEST tests the file private/eval_fun.m.
n = randi([1, 100]);
x = randn(n, 1);
f_return = 1e30;

verifyEqual(testCase, eval_fun(@eval_fun_tmp, x), f_return)

n = randi([101, 200]);
x = randn(n, 1);
f_return = 1e30;

verifyEqual(testCase, eval_fun(@eval_fun_tmp, x), f_return)

n = randi([201, 300]);
x = randn(n, 1);
f_return = 1e30;

verifyEqual(testCase, eval_fun(@eval_fun_tmp, x), f_return)

end

function get_default_constant_test(testCase)
%GET_DEFAULT_CONSTANT_TEST tests the file private/get_default_constant.m.
constant_name = "MaxFunctionEvaluations_dim_factor";
constant_value = 500;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_expand_small";
constant_value = 1.25;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_shrink_small";
constant_value = 0.4;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_expand_small_noisy";
constant_value = 2;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_shrink_small_noisy";
constant_value = 0.5;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_expand_big";
constant_value = 1.25;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_shrink_big";
constant_value = 0.4;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_expand_big_noisy";
constant_value = 1.25;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ds_shrink_big_noisy";
constant_value = 0.4;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "expand_small";
constant_value = 2;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "shrink_small";
constant_value = 0.5;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "expand_big";
constant_value = 1.25;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "shrink_big";
constant_value = 0.65;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "expand_big_noisy";
constant_value = 1.25;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "shrink_big_noisy";
constant_value = 0.85;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

assert(strcmp(func2str(get_default_constant("forcing_function")), func2str(@(alpha) alpha^2)));

constant_name = "reduction_factor";
constant_value = [0, eps, eps];
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "StepTolerance";
constant_value = 1e-6;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "ftarget";
constant_value = -inf;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "polling_inner";
constant_value = "opportunistic";
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "alpha_init";
constant_value = 1;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "seed";
constant_value = "shuffle";
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "cycling_inner";
constant_value = 1;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "output_xhist";
constant_value = false;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "output_alpha_hist";
constant_value = false;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "output_block_hist";
constant_value = false;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

constant_name = "iprint";
constant_value = 0;
verifyEqual(testCase, get_default_constant(constant_name), constant_value)

end

function get_exitflag_test(testCase)
%GET_EXITFLAG_TEST tests the file private/get_exitflag.m.

information = "SMALL_ALPHA";
EXITFLAG = 0;
verifyEqual(testCase, get_exitflag(information), EXITFLAG)

information = "FTARGET_REACHED";
EXITFLAG = 1;
verifyEqual(testCase, get_exitflag(information), EXITFLAG)

information = "MAXFUN_REACHED";
EXITFLAG = 2;
verifyEqual(testCase, get_exitflag(information), EXITFLAG)

information = "MAXIT_REACHED";
EXITFLAG = 3;
verifyEqual(testCase, get_exitflag(information), EXITFLAG)

end

function direction_set_test(testCase)
%direction_set_TEST tests the file private/get_direction_set.m.

% Set the random seed for reproducibility.
dt = datetime("now", "TimeZone", 'Asia/Shanghai');
yw = 100*mod(year(dt), 100) + week(dt);
rng(yw);

n = randi([1,100]);
D = [zeros(n) zeros(n)];
for i = 1:n
    D(i, 2*i-1) = 1;
    D(i, 2*i) = -1;
end
verifyEqual(testCase, get_direction_set(n), D)

options = struct();
verifyEqual(testCase, get_direction_set(n, options), D)

n = randi([1000,2000]);
options = struct();
A = randn(n);
options.direction_set = A;
D = get_direction_set(n, options);
D_unique = D(:, 1:2:2*n-1);
% Note: get_direction_set may sort the columns of Q. It may also remove columns 
% that are too short or retain only the first among collinear vectors. 
% However, for random matrices, the probability of such cases is negligible. 
% According to High-Dimensional Probability (Remark 3.2.5), 
% independent random vectors in high dimensions are almost surely orthogonal, 
% so collinearity is not a concern here.
[is_A_cols_in_B, ~] = ismember(D_unique', A', 'rows');
[is_B_cols_in_A, ~] = ismember(A', D_unique', 'rows');
if ~all(is_A_cols_in_B) || ~all(is_B_cols_in_A)
    error('The directions are not the same as the input.');
end
if D(:, 1:2:2*n-1) ~= -D(:, 2:2:2*n)
    error('The directions in one block are not opposite.');
end
[~, R] = qr(D_unique, 0);
r = sum(abs(diag(R)) > 1e-10);
if r ~= n
    error('The odd columns of D is not a basis.');
end

n = randi([1,100]);
options = struct();
A = randn(n);
[Q, ~] = qr(A);
options.direction_set = Q;
D = get_direction_set(n, options);
D_unique = D(:, 1:2:2*n-1);
% Notice that get_direction_set may sort the columns of Q.
% So we need to check the sorted columns.
[is_A_cols_in_B, ~] = ismember(D_unique', Q', 'rows');
[is_B_cols_in_A, ~] = ismember(Q', D_unique', 'rows');
if ~all(is_A_cols_in_B) || ~all(is_B_cols_in_A)
    error('The directions are not the same as the input.');
end
if D(:, 1:2:2*n-1) ~= -D(:, 2:2:2*n)
    error('The directions in one block are not opposite.');
end
[~, R] = qr(D_unique, 0);
r = sum(abs(diag(R)) > 1e-10);
if r ~= n
    error('The odd columns of D is not a basis.');
end

n = randi([1,100]);
options = struct();
% Generate a random matrix with non-zero determinant.
A = zeros(n);
detA = 0;
while detA == 0
    A = randn(n);
    detA = det(A);
end
options.direction_set = A;
D = get_direction_set(n, options);
D_unique = D(:, 1:2:2*n-1);
[is_A_cols_in_B, ~] = ismember(D_unique', A', 'rows');
[is_B_cols_in_A, ~] = ismember(A', D_unique', 'rows');
if ~all(is_A_cols_in_B) || ~all(is_B_cols_in_A)
    error('The directions are not the same as the input.');
end
if D(:, 1:2:2*n-1) ~= -D(:, 2:2:2*n)
    error('The directions in one block are not opposite.');
end
[~, R] = qr(D_unique, 0);
r = sum(abs(diag(R)) > 1e-10);
if r ~= n
    error('The odd columns of D is not a basis.');
end

n = randi([1,100]);
options.direction_set = NaN(n, n);
D = [zeros(n) zeros(n)];
for i = 1:n
    D(i, 2*i-1) = 1;
    D(i, 2*i) = -1;
end
verifyEqual(testCase, get_direction_set(n, options), D)

n = randi([1,100]);
options.direction_set = inf(n, n);
D = [zeros(n) zeros(n)];
for i = 1:n
    D(i, 2*i-1) = 1;
    D(i, 2*i) = -1;
end
verifyEqual(testCase, get_direction_set(n, options), D)

%The following example is based on https://github.com/libprima/prima/blob/main/matlab/tests/testprima.m, which is written
%by Zaikun Zhang.
function [f, g, H]=chrosen(x)
%CHROSEN calculates the function value, gradient, and Hessian of the
%   Chained Rosenbrock function.
%   See
%   [1] Toint (1978), 'Some numerical results using a sparse matrix
%   updating formula in unconstrained optimization'
%   [2] Powell (2006), 'The NEWUOA software for unconstrained
%   optimization without derivatives'

n=length(x);

alpha = 4;

f=0; % Function value
g=zeros(n,1); % Gradient
H=zeros(n,n); % Hessian

for i=1:n-1
    f = f + (x(i)-1)^2+alpha*(x(i)^2-x(i+1))^2;

    g(i)   = g(i) + 2*(x(i)-1)+alpha*2*(x(i)^2-x(i+1))*2*x(i);
    g(i+1) = g(i+1) - alpha*2*(x(i)^2-x(i+1));

    H(i,i)    =  H(i,i)+2+alpha*2*2*(3*x(i)^2-x(i+1));
    H(i,i+1)  =  H(i,i+1)-alpha*2*2*x(i);
    H(i+1,i)  =  H(i+1,i) -alpha*2*2*x(i);
    H(i+1,i+1)=  H(i+1,i+1)+alpha*2;
end
end

function bds_test(testCase)
%BDS_TEST tests the file ./bds.m.
x0 = zeros(3,1);
[~, fopt, ~, ~] = bds(@chrosen, x0);
verifyEqual(testCase, fopt, 0)
options = struct();
options.iprint = 0;
options.MaxFunctionEvaluations = 5000 * length(x0);
options.ftarget = -inf;
options.output_alpha_hist = true;
options.output_xhist = true;
options.debug_flag = true;
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
verifyEqual(testCase, fopt, 0)

% Test the case where the block_visiting_pattern is "parallel".
options.block_visiting_pattern = "parallel";
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-3
    error('The function value is not close to 0.');
end

% Test the case where the block_visiting_pattern is "random".
options.block_visiting_pattern = "random";
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is 1.
options.batch_size = 1;
options.debug_flag = false;
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is 2.
options.batch_size = 2;
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is 3.
options.batch_size = 3;
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is 3 and the replacement_delay is 0.
options.replacement_delay = 0;
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is 3 and the replacement_delay is 1.
options.replacement_delay = 1;
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is 3 and the replacement_delay is 2.
options.replacement_delay = 2;
if abs(fopt) > 1e-8
    error('The function value is not close to 0.');
end
options = rmfield(options, 'replacement_delay');
options = rmfield(options, 'batch_size');

% Test the case where the block_visiting_pattern is "parallel" and the 
% batch_size is equal to the number of variables.
options.block_visiting_pattern = "parallel";
options.batch_size = numel(x0);
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-3
    error('The function value is not close to 0.');
end

% Test the case where the batch_size is equal to the num_blocks. Both
% of them are 1.
options.batch_size = 1;
options.num_blocks = 1;
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-6
    error('The function value is not close to 0.');
end
% When both batch_size and num_blocks are 1, test different cases of
% block_visiting_pattern.
options.block_visiting_pattern = "random";
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-6
    error('The function value is not close to 0.');
end
options.block_visiting_pattern = "sorted";
[~, fopt, ~, ~] = bds(@chrosen, x0, options);
if abs(fopt) > 1e-6
    error('The function value is not close to 0.');
end

end

end
