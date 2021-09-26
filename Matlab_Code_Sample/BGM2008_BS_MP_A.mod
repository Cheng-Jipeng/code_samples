/*The code replicates the baseline model in BGM 2008 with monetary policy shock
 *Labor elasticity: phi=0
 */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Endogeneous variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var rho             ${\rho}$                (long_name='Relative price of goods')
    mu              ${\mu}$                 (long_name='Markup')
    d               ${d}$                   (long_name='Firm profits') 
    w               ${w}$                   (long_name='Real wages')
    L               ${L}$                   (long_name='Labor efforts')    
    Ne              ${N_E}$                 (long_name='Number of new entrants')
    N               ${N}$                   (long_name='Number of producing firms') 
    v               ${v}$                   (long_name='Firm value')
    C               ${C}$                   (long_name='Consumption')
    Z               ${Z}$                   (long_name='Aggregate productivity') 
    YC              ${Y^C}$                 (long_name='The aggregate output of the consumption basket')         
    pi              ${\pi}$                 (long_name='Producer Price Index')
    i               ${i}$                   (long_name='Nominal interst rate on bonds')
    pai             ${\pi^C}$               (long_name='Consumer Price Index')
    fe              ${f_E}$                 (long_name='Entry cost')
    r               ${r}$                   (long_name='Real consumption-based interest rate on bonds')
    ve              ${v^E}$                 (long_name='Investment')
    Y               ${Y}$                   (long_name='GDP')
    Yr              ${Y_R}$                 (long_name='Empirical GDP')
    Le              ${L^E}$                 (long_name='Labor in creation of new variety')
    Lc              ${L^C}$                 (long_name='Labor in existing production')
    l               ${l}$                   (long_name='Firm demand of labor')
    yy              ${y}$                   (long_name='Firm level output')

;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exogenous  variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo eps_Z           ${\varepsilon_{Z}}$               (long_name='Productivity shock')                       
;
parameters
    theta       ${\theta}$             (long_name='elasticity of subsitution across goods')
    delta       ${\delta}$             (long_name='exogenous exit rate')
    betaa       ${\beta}$              (long_name='discount factor')
    chi         ${\chi}$               (long_name='the weight of the disutility of labor')
    kappa       ${\kappa}$             (long_name='price stickness parameter')      
    phi         ${\varphi}$            (long_name='frisch elasticity of labor supply to wages')
    phiZ        ${\phi_{Z}}$           (long_name='Productivity AR process parameter')
    tauL            ${\tau^L}$              (long_name='Labor subsidy')

   ;
    
    % Calibration
    betaa   =   0.99;
    delta   =   0.025;
    theta   =   3.8 ; 
    chi     =   0.924271 ;
    kappa   =   77 ;
    phi     =   0 ;
    phiZ    =   0.979 ; 
    tauL    =   1/(theta-1);


model;    
%Reduced-form model
  [name='Pricing']
   rho          =  mu+w-Z;
  [name='Markup']
   pi           =  betaa*(1-delta)*pi(+1)-(theta-1)*mu/kappa;
  [name='Variety effect']
   rho          = N*(1/(theta-1));
  [name='Profits']
   d            = YC-N+(theta-1)*mu;
  [name='Free entry'] 
   v            = fe+w-Z;
  [name='Number of firms']
   N            = (1-delta)*N(-1)+delta*Ne ;
  [name='Intratemporal optimality']
   L            = phi*(w-C);
  [name='Euler euqation (shares)']
   C(+1)        = C+(1-delta)*v(+1)/(1+r)-v+(r+delta)*d(+1)/(1+r);  
  [name='Euler euqation (bonds)']
   C(+1)        = C+i-pai(+1); 
  [name='Output of consumption sector'] 
   YC           = C;
  [name='Aggregate accounting'] 
   YC+delta*v/((r+delta)*theta)+delta*Ne/((r+delta)*theta)=(theta-1)*w/theta+(theta-1)*L/theta+d/theta+N/theta;
  [name='CPI inflation'] 
   pi-pai       =rho-rho(-1);
  [name='Monetary policy'] 
    i=0.8*i(-1)+0.3*pi(+1)-eps_Z;
  [name='Entry cost'] 
   fe           = 0;
  [name='Aggregate productivity'] 
   Z            = 0;

%Other var in model
  [name='Consumption-based real interest rate on bonds'] 
    r           = i(-1);  
  [name='Investment in new firms'] 
    ve          = v+Ne;
  [name='GDP'] 
    (1+delta/(theta*(r+delta)))*Y = delta*ve/(theta*(r+delta))+C;
  [name='Empirical GDP'] 
    Yr          = Y-rho;
  [name='Labor used to create new firms'] 
    Le          = Ne+fe-Z;
  [name='Labor used in production of consumptions'] 
    Lc          = l+N;
  [name='Firm labor demand for productive purpose'] 
    l           = C-N-rho-Z;
  [name='Firm level output'] 
    yy          = Z+l;
%%%% [name='Nominal dividends'] 
%%%%    D           = P*d ;           
%%%%  [name='Consumption-based real interest rate on bonds'] 
%%%%    r           = (1+i(-1))/(1+pai)-1;                    
%%%%  [name='Investment in new firms'] 
%%%%    ve          = v*Ne;
%%%%  [name='GDP'] 
%%%%    Y           = ve+C;
%%%%  [name='Labor used to create new firms'] 
%%%%    Le          = Ne*fe/Z;
%%%%  [name='Labor used in production of consumptions'] 
%%%%    Lc          = L-Le;
%%%%  [name='Firm labor demand for productive purpose'] 
%%%%    l           = C/(N*rho*Z);
%%%%  [name='Firm level output'] 
%%%%    yy          = Z*l;

end;

initval;
rho   =0;
mu    =0;       
d     =0;       
w     =0;       
L     =0;       
Ne    =0;       
N     =0;       
v     =0;            
C     =0;       
Z     =0;       
YC    =0;       
pi    =0;       
i     =0;       
pai   =0;       
fe    =0;
r     =0; 
ve    =0;
Y     =0;
Yr    =0;
Le    =0;
Lc    =0;
l     =0;
yy    =0;      
end;
resid;

// options_.TeX=1;
% Shock to monetary policy
shocks;
    var eps_Z=1;
end;
steady;
check;
stoch_simul(order=1,nograph,hp_filter=1600,irf=100) i pi pai r C Ne N L w mu d v rho ve Y Le Lc l yy Yr;

