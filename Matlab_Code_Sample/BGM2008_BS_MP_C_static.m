function [residual, g1, g2, g3] = BGM2008_BS_MP_C_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 23, 1);

%
% Model equations
%

T102 = params(2)/(params(1)*(params(2)+y(16)));
lhs =y(1);
rhs =y(2)+y(4)-y(10);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(3)*(1-params(2))-y(2)*(params(1)-1)/params(5);
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(7)*1/(params(1)-1);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(2)*(params(1)-1)+y(11)-y(7);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(4)+y(15)-y(10);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =(1-params(2))*y(7)+params(2)*y(6);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =params(6)*(y(4)-y(9));
residual(7)= lhs-rhs;
lhs =y(9);
rhs =y(9)+(1-params(2))*y(8)/(1+y(16))-y(8)+y(3)*(params(2)+y(16))/(1+y(16));
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(9)+y(13)-y(14);
residual(9)= lhs-rhs;
lhs =y(11);
rhs =y(9);
residual(10)= lhs-rhs;
lhs =y(11)+params(2)*y(8)/(params(1)*(params(2)+y(16)))+params(2)*y(6)/(params(1)*(params(2)+y(16)));
rhs =y(4)*(params(1)-1)/params(1)+(params(1)-1)*y(5)/params(1)+y(3)/params(1)+y(7)/params(1);
residual(11)= lhs-rhs;
residual(12) = y(12)-y(14);
lhs =y(13);
rhs =y(13)*0.8+y(12)*0.3-x(1);
residual(13)= lhs-rhs;
residual(14) = y(15);
residual(15) = y(10);
lhs =y(16);
rhs =y(13);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(8)+y(6);
residual(17)= lhs-rhs;
lhs =(1+T102)*y(18);
rhs =y(9)+params(2)*y(17)/(params(1)*(params(2)+y(16)));
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(18)-y(1);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(15)+y(6)-y(10);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(7)+y(22);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(9)-y(7)-y(1)-y(10);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(10)+y(22);
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,2)=(-1);
  g1(1,4)=(-1);
  g1(1,10)=1;
  g1(2,2)=(params(1)-1)/params(5);
  g1(2,12)=1-params(3)*(1-params(2));
  g1(3,1)=1;
  g1(3,7)=(-(1/(params(1)-1)));
  g1(4,2)=(-(params(1)-1));
  g1(4,3)=1;
  g1(4,7)=1;
  g1(4,11)=(-1);
  g1(5,4)=(-1);
  g1(5,8)=1;
  g1(5,10)=1;
  g1(5,15)=(-1);
  g1(6,6)=(-params(2));
  g1(6,7)=1-(1-params(2));
  g1(7,4)=(-params(6));
  g1(7,5)=1;
  g1(7,9)=params(6);
  g1(8,3)=(-((params(2)+y(16))/(1+y(16))));
  g1(8,8)=(-((1-params(2))/(1+y(16))-1));
  g1(8,16)=(-((-((1-params(2))*y(8)))/((1+y(16))*(1+y(16)))+(y(3)*(1+y(16))-y(3)*(params(2)+y(16)))/((1+y(16))*(1+y(16)))));
  g1(9,13)=(-1);
  g1(9,14)=1;
  g1(10,9)=(-1);
  g1(10,11)=1;
  g1(11,3)=(-(1/params(1)));
  g1(11,4)=(-((params(1)-1)/params(1)));
  g1(11,5)=(-((params(1)-1)/params(1)));
  g1(11,6)=T102;
  g1(11,7)=(-(1/params(1)));
  g1(11,8)=T102;
  g1(11,11)=1;
  g1(11,16)=(-(params(1)*params(2)*y(8)))/(params(1)*(params(2)+y(16))*params(1)*(params(2)+y(16)))+(-(params(1)*params(2)*y(6)))/(params(1)*(params(2)+y(16))*params(1)*(params(2)+y(16)));
  g1(12,12)=1;
  g1(12,14)=(-1);
  g1(13,12)=(-0.3);
  g1(13,13)=0.2;
  g1(14,15)=1;
  g1(15,10)=1;
  g1(16,13)=(-1);
  g1(16,16)=1;
  g1(17,6)=(-1);
  g1(17,8)=(-1);
  g1(17,17)=1;
  g1(18,9)=(-1);
  g1(18,16)=y(18)*(-(params(2)*params(1)))/(params(1)*(params(2)+y(16))*params(1)*(params(2)+y(16)))-(-(params(1)*params(2)*y(17)))/(params(1)*(params(2)+y(16))*params(1)*(params(2)+y(16)));
  g1(18,17)=(-T102);
  g1(18,18)=1+T102;
  g1(19,1)=1;
  g1(19,18)=(-1);
  g1(19,19)=1;
  g1(20,6)=(-1);
  g1(20,10)=1;
  g1(20,15)=(-1);
  g1(20,20)=1;
  g1(21,7)=(-1);
  g1(21,21)=1;
  g1(21,22)=(-1);
  g1(22,1)=1;
  g1(22,7)=1;
  g1(22,9)=(-1);
  g1(22,10)=1;
  g1(22,22)=1;
  g1(23,10)=(-1);
  g1(23,22)=(-1);
  g1(23,23)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,529);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,12167);
end
end
end
end
