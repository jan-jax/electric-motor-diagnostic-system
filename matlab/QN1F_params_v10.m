% Wersja modelu do pracy magisterskiej

%% Parametry katalogowe
Pn_rated   = 4.5e3;
n_rated    = 18000;
n_max      = 24000;
T_rated    = 2.3;
I_rated    = 10;
pole_pairs = 1;

%% Parametry modelowe
J       = 2.5e-3;
B       = 2.0e-5;
tau_T   = 0.05;
n_ref   = n_rated;
f_max   = n_max*pole_pairs/60;
Kp_f    = 0.05;
s_ref_model = 0.02;
K_slip  = T_rated/s_ref_model;

%% Parametry skrawania
T_cut_mean  = 1.0;
T_cut_amp   = 0.15;
t_cut_start = 4.0;
z_teeth     = 2;
f_tooth     = (n_rated/60)*z_teeth;
w_tooth     = 2*pi*f_tooth;