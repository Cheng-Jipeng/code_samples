function [residual, g1, g2, g3] = BGM2008_BS_MP_A_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(23, 1);
T111 = params(2)/(params(1)*(params(2)+y(19)));
lhs =y(4);
rhs =y(5)+y(7)-y(13);
residual(1)= lhs-rhs;
lhs =y(15);
rhs =params(3)*(1-params(2))*y(30)-y(5)*(params(1)-1)/params(5);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(10)*1/(params(1)-1);
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(5)*(params(1)-1)+y(14)-y(10);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =y(7)+y(18)-y(13);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =(1-params(2))*y(2)+params(2)*y(9);
residual(6)= lhs-rhs;
lhs =y(8);
rhs =params(6)*(y(7)-y(12));
residual(7)= lhs-rhs;
lhs =y(29);
rhs =y(12)+(1-params(2))*y(28)/(1+y(19))-y(11)+(params(2)+y(19))*y(27)/(1+y(19));
residual(8)= lhs-rhs;
lhs =y(29);
rhs =y(12)+y(16)-y(31);
residual(9)= lhs-rhs;
lhs =y(14);
rhs =y(12);
residual(10)= lhs-rhs;
lhs =y(14)+params(2)*y(11)/(params(1)*(params(2)+y(19)))+params(2)*y(9)/(params(1)*(params(2)+y(19)));
rhs =y(7)*(params(1)-1)/params(1)+(params(1)-1)*y(8)/params(1)+y(6)/params(1)+y(10)/params(1);
residual(11)= lhs-rhs;
lhs =y(15)-y(17);
rhs =y(4)-y(1);
residual(12)= lhs-rhs;
lhs =y(16);
rhs =0.8*y(3)+y(30)*0.3-x(it_, 1);
residual(13)= lhs-rhs;
residual(14) = y(18);
residual(15) = y(13);
lhs =y(19);
rhs =y(3);
residual(16)= lhs-rhs;
lhs =y(20);
rhs =y(11)+y(9);
residual(17)= lhs-rhs;
lhs =(1+T111)*y(21);
rhs =y(12)+params(2)*y(20)/(params(1)*(params(2)+y(19)));
residual(18)= lhs-rhs;
lhs =y(22);
rhs =y(21)-y(4);
residual(19)= lhs-rhs;
lhs =y(23);
rhs =y(18)+y(9)-y(13);
residual(20)= lhs-rhs;
lhs =y(24);
rhs =y(10)+y(25);
residual(21)= lhs-rhs;
lhs =y(25);
rhs =y(12)-y(10)-y(4)-y(13);
residual(22)= lhs-rhs;
lhs =y(26);
rhs =y(13)+y(25);
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 32);

  %
  % Jacobian matrix
  %

  g1(1,4)=1;
  g1(1,5)=(-1);
  g1(1,7)=(-1);
  g1(1,13)=1;
  g1(2,5)=(params(1)-1)/params(5);
  g1(2,15)=1;
  g1(2,30)=(-(params(3)*(1-params(2))));
  g1(3,4)=1;
  g1(3,10)=(-(1/(params(1)-1)));
  g1(4,5)=(-(params(1)-1));
  g1(4,6)=1;
  g1(4,10)=1;
  g1(4,14)=(-1);
  g1(5,7)=(-1);
  g1(5,11)=1;
  g1(5,13)=1;
  g1(5,18)=(-1);
  g1(6,9)=(-params(2));
  g1(6,2)=(-(1-params(2)));
  g1(6,10)=1;
  g1(7,7)=(-params(6));
  g1(7,8)=1;
  g1(7,12)=params(6);
  g1(8,27)=(-((params(2)+y(19))/(1+y(19))));
  g1(8,11)=1;
  g1(8,28)=(-((1-params(2))/(1+y(19))));
  g1(8,12)=(-1);
  g1(8,29)=1;
  g1(8,19)=(-((-((1-params(2))*y(28)))/((1+y(19))*(1+y(19)))+((1+y(19))*y(27)-(params(2)+y(19))*y(27))/((1+y(19))*(1+y(19)))));
  g1(9,12)=(-1);
  g1(9,29)=1;
  g1(9,16)=(-1);
  g1(9,31)=1;
  g1(10,12)=(-1);
  g1(10,14)=1;
  g1(11,6)=(-(1/params(1)));
  g1(11,7)=(-((params(1)-1)/params(1)));
  g1(11,8)=(-((params(1)-1)/params(1)));
  g1(11,9)=T111;
  g1(11,10)=(-(1/params(1)));
  g1(11,11)=T111;
  g1(11,14)=1;
  g1(11,19)=(-(params(1)*params(2)*y(11)))/(params(1)*(params(2)+y(19))*params(1)*(params(2)+y(19)))+(-(params(1)*params(2)*y(9)))/(params(1)*(params(2)+y(19))*params(1)*(params(2)+y(19)));
  g1(12,1)=1;
  g1(12,4)=(-1);
  g1(12,15)=1;
  g1(12,17)=(-1);
  g1(13,30)=(-0.3);
  g1(13,3)=(-0.8);
  g1(13,16)=1;
  g1(13,32)=1;
  g1(14,18)=1;
  g1(15,13)=1;
  g1(16,3)=(-1);
  g1(16,19)=1;
  g1(17,9)=(-1);
  g1(17,11)=(-1);
  g1(17,20)=1;
  g1(18,12)=(-1);
  g1(18,19)=y(21)*(-(params(2)*params(1)))/(params(1)*(params(2)+y(19))*params(1)*(params(2)+y(19)))-(-(params(1)*params(2)*y(20)))/(params(1)*(params(2)+y(19))*params(1)*(params(2)+y(19)));
  g1(18,20)=(-T111);
  g1(18,21)=1+T111;
  g1(19,4)=1;
  g1(19,21)=(-1);
  g1(19,22)=1;
  g1(20,9)=(-1);
  g1(20,13)=1;
  g1(20,18)=(-1);
  g1(20,23)=1;
  g1(21,10)=(-1);
  g1(21,24)=1;
  g1(21,25)=(-1);
  g1(22,4)=1;
  g1(22,10)=1;
  g1(22,12)=(-1);
  g1(22,13)=1;
  g1(22,25)=1;
  g1(23,13)=(-1);
  g1(23,25)=(-1);
  g1(23,26)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,1024);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,32768);
end
end
end
end
