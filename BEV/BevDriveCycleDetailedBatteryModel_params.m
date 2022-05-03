%% Model Parameters for BEV Drive Cycle with detail battery module

% Copyright 2020-2021 The MathWorks, Inc.
% Data for the two battery packs, HV1 and HV2, in parallel are same
% To run scenarios with different parameter values, run the script again

%% Vehicle
%Vehicle1DBasicParams
%-{
vehicle.vehMass_kg = 1600;
vehicle.tireRollingRadius_cm = 30;
vehicle.roadLoadA_N = 100;
vehicle.roadLoadB_N_per_kph = 0.05;
vehicle.roadLoadC_N_per_kph2 = 0.035;
vehicle.roadGrade=0;
%}

%% High Voltage Battery

batteryHV.batteryCoolantFlwR=1; % Coolant flow rate
batteryHV.batteryCoolantFlwT=-10; % Coolant temperature
batteryHV.AmbTemp=293.15;
batteryHV.batterySOC_LUT = [0 0.1 0.25 0.5 0.75 0.9 1]';   % State of charge table breakpoints S
batteryHV.batteryTemp_LUT = [278 293 313];          % Temperature table breakpoints T
batteryHV.batteryCapacity_LUT = 10; % Battery cell capacity




%% Battery Pack 1
batteryHV1.batteryNp = 2;                          % Number of parallel cells in a string
batteryHV1.batteryNs = 18;                         % Number of series connected strings
batteryHV1.battery_N_cells = batteryHV1.batteryNp*batteryHV1.batteryNs; % Number of cells per module 
batteryHV1.batteryCell_mass = 0.125; % [kg] Cell mass
batteryHV1.batteryCell_cp = 500; % [J/kg/K] Cell specific heat

batteryHV1.batterySOC_LUT = batteryHV.batterySOC_LUT;   % State of charge table breakpoints S
batteryHV1.batteryTemp_LUT = batteryHV.batteryTemp_LUT;          % Temperature table breakpoints T
batteryHV1.batteryCapacity_LUT = batteryHV.batteryCapacity_LUT ; % Battery cell capacity 
batteryHV1.batteryEm_LUT = [
    3.4966    3.5057    3.5148
    3.5519    3.5660    3.5653
    3.6183    3.6337    3.6402
    3.7066    3.7127    3.7213
    3.9131    3.9259    3.9376
    4.0748    4.0777    4.0821
    4.1923    4.1928    4.1930]; % [V] Em open-circuit voltage vs SOC rows and T columns
batteryHV1.batteryR0_LUT = [
    0.0117    0.0085    0.0090
    0.0110    0.0085    0.0090
    0.0114    0.0087    0.0092
    0.0107    0.0082    0.0088
    0.0107    0.0083    0.0091
    0.0113    0.0085    0.0089
    0.0116    0.0085    0.0089]; % [Ohm] R0 resistance vs SOC rows and T columns
batteryHV1.batteryR1_LUT = [
    0.0109    0.0029    0.0013
    0.0069    0.0024    0.0012
    0.0047    0.0026    0.0013
    0.0034    0.0016    0.0010
    0.0033    0.0023    0.0014
    0.0033    0.0018    0.0011
    0.0028    0.0017    0.0011]; % [Ohm] R1 Resistance vs SOC rows and T columns
batteryHV1.batteryC1_LUT = [
    1913.6    12447    30609
    4625.7    18872    32995
    23306     40764    47535
    10736     18721    26325
    18036     33630    48274
    12251     18360    26839
    9022.9    23394    30606]; % [F] C1 Capacitance vs SOC rows and T columns

batteryHV1.batteryTau1_LUT = batteryHV1.batteryR1_LUT.*batteryHV1.batteryC1_LUT;
batteryHV1.batteryCoolant_flow=[.01, .02, .03, .04, .05, .6];
batteryHV1.batteryCoolantHTC=zeros(3, 6, batteryHV1.battery_N_cells);
batteryHV1.batteryModuleTopHTC = 1; % Heat transfer coefficient on module top
batteryHV1.batteryModuleBottomHTC=zeros(3, 6, batteryHV1.battery_N_cells); % Heat transfer coefficient on module bottom
batteryHV1.batteryThermal_K1 = 0.8;  % Battery cell (through-plane) thermal conductivity [W/mK]
batteryHV1.batteryThermal_K2 = 800;  % Battery cell (in-plane) thermal conductivity [W/mK]

batteryHV1.batteryCell_H = 0.2;   % Battery cell height [m]
batteryHV1.batteryCell_T = 0.012; % Battery cell thic.kness [m]
batteryHV1.batteryCell_W = 0.12;  % Battery cell width [m]

batteryHV1.battery_T_init   = 30;
batteryHV1.battery_SOC_init = 0.95;
batteryHV1.battery_extR = 0;       % Battery Module ascessory resistance (Ohm)
batteryHV1.batteryModuleCellR0_ini  = ones(1,batteryHV1.battery_N_cells);                   % Cell-to-cell capacity variation (-)
batteryHV1.batteryModuleCellSOC_ini = batteryHV1.battery_SOC_init* ...
                                    ones(1,batteryHV1.battery_N_cells);  % Cell-to-cell initial SOC variation (-)
batteryHV1.batteryModuleCellT_ini = (batteryHV1.battery_T_init+273) ...
                                    *ones(1,batteryHV1.battery_N_cells);% Cell-to-cell initial temperature variation (K)
batteryHV1.batteryModuleExtHeat = zeros(1,batteryHV1.battery_N_cells);                      % Cell-to-cell external heat flux variation (W)
batteryHV1.batteryModuleCellAhr_ini = batteryHV1.batteryCapacity_LUT(1) ...
                                    *ones(1,batteryHV1.battery_N_cells);                  % Cell-to-cell resistance variation (-) for Module

batteryHV1.batteryCoolantFlwR=0.1; % Coolant flow rate
batteryHV1.batteryCoolantFlwT=300; % Coolant temperature

%% Battery Pack 2
batteryHV2.batteryNp = 2;                          % Number of parallel cells in a string
batteryHV2.batteryNs = 18;                         % Number of series connected strings
batteryHV2.battery_N_cells = batteryHV2.batteryNp*batteryHV2.batteryNs; % Number of cells per module 
batteryHV2.batteryCell_mass = 0.125; % [kg] Cell mass
batteryHV2.batteryCell_cp = 500; % [J/kg/K] Cell specific heat

batteryHV2.batterySOC_LUT = batteryHV.batterySOC_LUT;   % State of charge table breakpoints S
batteryHV2.batteryTemp_LUT = batteryHV.batteryTemp_LUT;          % Temperature table breakpoints T
batteryHV2.batteryCapacity_LUT = batteryHV.batteryCapacity_LUT ; % Battery cell capacity
batteryHV2.batteryEm_LUT = [
    3.4966    3.5057    3.5148
    3.5519    3.5660    3.5653
    3.6183    3.6337    3.6402
    3.7066    3.7127    3.7213
    3.9131    3.9259    3.9376
    4.0748    4.0777    4.0821
    4.1923    4.1928    4.1930]; % [V] Em open-circuit voltage vs SOC rows and T columns
batteryHV2.batteryR0_LUT = [
    0.0117    0.0085    0.0090
    0.0110    0.0085    0.0090
    0.0114    0.0087    0.0092
    0.0107    0.0082    0.0088
    0.0107    0.0083    0.0091
    0.0113    0.0085    0.0089
    0.0116    0.0085    0.0089]; % [Ohm] R0 resistance vs SOC rows and T columns
batteryHV2.batteryR1_LUT = [
    0.0109    0.0029    0.0013
    0.0069    0.0024    0.0012
    0.0047    0.0026    0.0013
    0.0034    0.0016    0.0010
    0.0033    0.0023    0.0014
    0.0033    0.0018    0.0011
    0.0028    0.0017    0.0011]; % [Ohm] R1 Resistance vs SOC rows and T columns
batteryHV2.batteryC1_LUT = [
    1913.6    12447    30609
    4625.7    18872    32995
    23306     40764    47535
    10736     18721    26325
    18036     33630    48274
    12251     18360    26839
    9022.9    23394    30606]; % [F] C1 Capacitance vs SOC rows and T columns

batteryHV2.batteryTau1_LUT = batteryHV2.batteryR1_LUT.*batteryHV2.batteryC1_LUT;
batteryHV2.batteryCoolant_flow=[.01, .02, .03, .04, .05, .06];
batteryHV2.batteryCoolantHTC=zeros(3, 6, batteryHV2.battery_N_cells);
batteryHV2.batteryModuleBottomHTC=zeros(3, 6, batteryHV1.battery_N_cells); % Heat transfer coefficient on module bottom
batteryHV2.batteryModuleTopHTC = 1; % Heat transfer coefficient on module top
batteryHV2.batteryThermal_K1 = 0.8;  % Battery cell (through-plane) thermal conductivity [W/mK]
batteryHV2.batteryThermal_K2 = 800;  % Battery cell (in-plane) thermal conductivity [W/mK]

batteryHV2.batteryCell_H = 0.2;   % Battery cell height [m]
batteryHV2.batteryCell_T = 0.012; % Battery cell thic.kness [m]
batteryHV2.batteryCell_W = 0.12;  % Battery cell width [m]

batteryHV2.battery_T_init   = 30;
batteryHV2.battery_SOC_init = 0.95;
batteryHV2.battery_extR = 0;       % Battery Module ascessory resistance (Ohm)
batteryHV2.batteryModuleCellR0_ini  = ones(1,batteryHV2.battery_N_cells);                   % Cell-to-cell capacity variation (-)
batteryHV2.batteryModuleCellSOC_ini = batteryHV2.battery_SOC_init*ones ...
                                        (1,batteryHV2.battery_N_cells);  % Cell-to-cell initial SOC variation (-)
batteryHV2.batteryModuleCellT_ini = (batteryHV2.battery_T_init+273)*ones ...
                                        (1,batteryHV2.battery_N_cells);% Cell-to-cell initial temperature variation (K)
batteryHV2.batteryModuleExtHeat = zeros(1,batteryHV2.battery_N_cells);                      % Cell-to-cell external heat flux variation (W)
batteryHV2.batteryModuleCellAhr_ini = batteryHV2.batteryCapacity_LUT(1)* ...
                                        ones(1,batteryHV2.battery_N_cells);                  % Cell-to-cell resistance variation (-) for Module


%% Control Parameters
batteryHV.batteryPackAhr_ini = max( max(batteryHV1.batteryCapacity_LUT), ... 
                            max(batteryHV2.batteryCapacity_LUT))...
                            *batteryHV1.batteryNp*2; % battery pack current rating
                        
batteryHV.minVolt = min( min(batteryHV1.batteryEm_LUT));
batteryHV.batteryNp = batteryHV1.batteryNp + batteryHV2.batteryNp;% Number of parallel cells in a stringin pack
batteryHV.batteryNs = batteryHV1.batteryNs + batteryHV2.batteryNs; % Number of series connected strings in pack
batteryHV.battery_N_cells = batteryHV1.battery_N_cells ...
                + batteryHV2.battery_N_cells; % Number of cells for Full pack
batteryHV.cRate  = [
    0    0    0
    1    2    2
    2    2    3
    2    3    4
    2    3    4
    3    4    5
    4    5    6]; % mac c rate for given Temp and SoC



%% Reduction Gear
bevGear.gearRatio = 7.0;
bevGear.efficiency = 0.98;

%% Motor Drive
motorDrive.simplePmsmDrv_trqMax_Nm = 360;
motorDrive.simplePmsmDrv_powMax_W = 150e+3;
motorDrive.simplePmsmDrv_timeConst_s = 0.02;

motorDrive.simplePmsmDrv_spdVec_rpm = [100, 450, 800, 1150, 1500];
motorDrive.simplePmsmDrv_trqVec_Nm = [10, 45, 80, 115, 150];
motorDrive.simplePmsmDrv_LossTbl_W = ...
[ 16.02, 251,   872.8, 2230, 4998; ...
  29.77, 262,   875.7, 2217, 4950; ...
  45.35, 281.2, 900,   2217, 4796; ...
  62.14, 299,   924.8, 2191, 4567; ...
  81.1,  320.9, 943.1, 2146, 4379];

motorDrive.simplePmsmDrv_rotorInertia_kg_m2 = 3.93*0.01^2;
motorDrive.simplePmsmDrv_rotorDamping_Nm_per_radps = 1e-5;
motorDrive.simplePmsmDrv_initialRotorSpd_rpm = 0;

motorDrive.spdCtl_trqMax_Nm = motorDrive.simplePmsmDrv_trqMax_Nm;

motorDrive.gearRatioCompensation = 3/bevGear.gearRatio;
motorDrive.AmbTemp=293.15;
motorDrive.ThermalMass=12000;
  % adjust the max motor speed

%% Driver & Environment

bevMotorSpdRef.tireRadius_cm = vehicle.tireRollingRadius_cm;
bevMotorSpdRef.reductionGearRaio = bevGear.gearRatio;

