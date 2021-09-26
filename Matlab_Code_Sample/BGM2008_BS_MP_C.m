%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'BGM2008_BS_MP_C';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('BGM2008_BS_MP_C.log');
M_.exo_names = 'eps_Z';
M_.exo_names_tex = '{\varepsilon_{Z}}';
M_.exo_names_long = 'Productivity shock';
M_.endo_names = 'rho';
M_.endo_names_tex = '{\rho}';
M_.endo_names_long = 'Relative price of goods';
M_.endo_names = char(M_.endo_names, 'mu');
M_.endo_names_tex = char(M_.endo_names_tex, '{\mu}');
M_.endo_names_long = char(M_.endo_names_long, 'Markup');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, '{d}');
M_.endo_names_long = char(M_.endo_names_long, 'Firm profits');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, '{w}');
M_.endo_names_long = char(M_.endo_names_long, 'Real wages');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, '{L}');
M_.endo_names_long = char(M_.endo_names_long, 'Labor efforts');
M_.endo_names = char(M_.endo_names, 'Ne');
M_.endo_names_tex = char(M_.endo_names_tex, '{N_E}');
M_.endo_names_long = char(M_.endo_names_long, 'Number of new entrants');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, '{N}');
M_.endo_names_long = char(M_.endo_names_long, 'Number of producing firms');
M_.endo_names = char(M_.endo_names, 'v');
M_.endo_names_tex = char(M_.endo_names_tex, '{v}');
M_.endo_names_long = char(M_.endo_names_long, 'Firm value');
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, '{C}');
M_.endo_names_long = char(M_.endo_names_long, 'Consumption');
M_.endo_names = char(M_.endo_names, 'Z');
M_.endo_names_tex = char(M_.endo_names_tex, '{Z}');
M_.endo_names_long = char(M_.endo_names_long, 'Aggregate productivity');
M_.endo_names = char(M_.endo_names, 'YC');
M_.endo_names_tex = char(M_.endo_names_tex, '{Y^C}');
M_.endo_names_long = char(M_.endo_names_long, 'The aggregate output of the consumption basket');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, '{\pi}');
M_.endo_names_long = char(M_.endo_names_long, 'Producer Price Index');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, '{i}');
M_.endo_names_long = char(M_.endo_names_long, 'Nominal interst rate on bonds');
M_.endo_names = char(M_.endo_names, 'pai');
M_.endo_names_tex = char(M_.endo_names_tex, '{\pi^C}');
M_.endo_names_long = char(M_.endo_names_long, 'Consumer Price Index');
M_.endo_names = char(M_.endo_names, 'fe');
M_.endo_names_tex = char(M_.endo_names_tex, '{f_E}');
M_.endo_names_long = char(M_.endo_names_long, 'Entry cost');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, '{r}');
M_.endo_names_long = char(M_.endo_names_long, 'Real consumption-based interest rate on bonds');
M_.endo_names = char(M_.endo_names, 've');
M_.endo_names_tex = char(M_.endo_names_tex, '{v^E}');
M_.endo_names_long = char(M_.endo_names_long, 'Investment');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, '{Y}');
M_.endo_names_long = char(M_.endo_names_long, 'GDP');
M_.endo_names = char(M_.endo_names, 'Yr');
M_.endo_names_tex = char(M_.endo_names_tex, '{Y_R}');
M_.endo_names_long = char(M_.endo_names_long, 'Empirical GDP');
M_.endo_names = char(M_.endo_names, 'Le');
M_.endo_names_tex = char(M_.endo_names_tex, '{L^E}');
M_.endo_names_long = char(M_.endo_names_long, 'Labor in creation of new variety');
M_.endo_names = char(M_.endo_names, 'Lc');
M_.endo_names_tex = char(M_.endo_names_tex, '{L^C}');
M_.endo_names_long = char(M_.endo_names_long, 'Labor in existing production');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, '{l}');
M_.endo_names_long = char(M_.endo_names_long, 'Firm demand of labor');
M_.endo_names = char(M_.endo_names, 'yy');
M_.endo_names_tex = char(M_.endo_names_tex, '{y}');
M_.endo_names_long = char(M_.endo_names_long, 'Firm level output');
M_.endo_partitions = struct();
M_.param_names = 'theta';
M_.param_names_tex = '{\theta}';
M_.param_names_long = 'elasticity of subsitution across goods';
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'exogenous exit rate');
M_.param_names = char(M_.param_names, 'betaa');
M_.param_names_tex = char(M_.param_names_tex, '{\beta}');
M_.param_names_long = char(M_.param_names_long, 'discount factor');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, '{\chi}');
M_.param_names_long = char(M_.param_names_long, 'the weight of the disutility of labor');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, '{\kappa}');
M_.param_names_long = char(M_.param_names_long, 'price stickness parameter');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, '{\varphi}');
M_.param_names_long = char(M_.param_names_long, 'frisch elasticity of labor supply to wages');
M_.param_names = char(M_.param_names, 'phiZ');
M_.param_names_tex = char(M_.param_names_tex, '{\phi_{Z}}');
M_.param_names_long = char(M_.param_names_long, 'Productivity AR process parameter');
M_.param_names = char(M_.param_names, 'tauL');
M_.param_names_tex = char(M_.param_names_tex, '{\tau^L}');
M_.param_names_long = char(M_.param_names_long, 'Labor subsidy');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 23;
M_.param_nbr = 8;
M_.orig_endo_nbr = 23;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('BGM2008_BS_MP_C_static');
erase_compiled_function('BGM2008_BS_MP_C_dynamic');
M_.orig_eq_nbr = 23;
M_.eq_nbr = 23;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 4 0;
 0 5 0;
 0 6 27;
 0 7 0;
 0 8 0;
 0 9 0;
 2 10 0;
 0 11 28;
 0 12 29;
 0 13 0;
 0 14 0;
 0 15 30;
 3 16 0;
 0 17 31;
 0 18 0;
 0 19 0;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;]';
M_.nstatic = 15;
M_.nfwrd   = 5;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 5;
M_.nspred   = 3;
M_.ndynamic   = 8;
M_.equations_tags = {
  1 , 'name' , 'Pricing' ;
  2 , 'name' , 'Markup' ;
  3 , 'name' , 'Variety effect' ;
  4 , 'name' , 'Profits' ;
  5 , 'name' , 'Free entry' ;
  6 , 'name' , 'Number of firms' ;
  7 , 'name' , 'Intratemporal optimality' ;
  8 , 'name' , 'Euler euqation (shares)' ;
  9 , 'name' , 'Euler euqation (bonds)' ;
  10 , 'name' , 'Output of consumption sector' ;
  11 , 'name' , 'Aggregate accounting' ;
  12 , 'name' , 'CPI inflation' ;
  13 , 'name' , 'Monetary policy' ;
  14 , 'name' , 'Entry cost' ;
  15 , 'name' , 'Aggregate productivity' ;
  16 , 'name' , 'Consumption-based real interest rate on bonds' ;
  17 , 'name' , 'Investment in new firms' ;
  18 , 'name' , 'GDP' ;
  19 , 'name' , 'Empirical GDP' ;
  20 , 'name' , 'Labor used to create new firms' ;
  21 , 'name' , 'Labor used in production of consumptions' ;
  22 , 'name' , 'Firm labor demand for productive purpose' ;
  23 , 'name' , 'Firm level output' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(23, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = [80; -1; -1];
M_.params( 3 ) = 0.99;
betaa = M_.params( 3 );
M_.params( 2 ) = 0.025;
delta = M_.params( 2 );
M_.params( 1 ) = 3.8;
theta = M_.params( 1 );
M_.params( 4 ) = 0.924271;
chi = M_.params( 4 );
M_.params( 5 ) = 77;
kappa = M_.params( 5 );
M_.params( 6 ) = 4;
phi = M_.params( 6 );
M_.params( 7 ) = 0.979;
phiZ = M_.params( 7 );
M_.params( 8 ) = 1/(M_.params(1)-1);
tauL = M_.params( 8 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.hp_filter = 1600;
options_.irf = 100;
options_.nograph = 1;
options_.order = 1;
var_list_ = char('i','pi','pai','r','C','Ne','N','L','w','mu','d','v','rho','ve','Y','Le','Lc','l','yy','Yr');
info = stoch_simul(var_list_);
save('BGM2008_BS_MP_C_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('BGM2008_BS_MP_C_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('BGM2008_BS_MP_C_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('BGM2008_BS_MP_C_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('BGM2008_BS_MP_C_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('BGM2008_BS_MP_C_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('BGM2008_BS_MP_C_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
