clear; clc; close all;
%{


Problem Statement: The engineering team has been asked by a local zoo to create a new viewing habitat for its baby elephants.

Create a breakeven analysis program so they can compare the possible options.


======List======
=======of=======
====Variables===
---------------------------------------------------------------------------
SA           - Surface Area of the Wall in [ft^2]
M_N          - Material Name
T_W          - Thickness of the wall in [ft]
M_C          - Material cost [$/ft^3]
MC_Materials - Cost of Miscellaneous construction materials [$]
L_C          - Labor cost in [$/(Person * week)]
NO_L         - Number of Laborers Working [person]
W_C          - Number of Weeks of Construction [week]
C_M          - Cost for all material services [$]
C_L          - Cost for paying all laborers   [$]
F_C          - Total Fixed Cost of the Operation [$]
E_C          - Operational Cost of Energy [$/week]
L_O_C        - Operational Cost of Labor in [$/week]
M_O_C        - Operational Cost of Maintanence in [$/week]
LA_C         - Operational Cost of LandFill in [$/week]
W_R_Z        - Operational Weeks per Year For The Zoo [weeks/year]
NO_YO        - The Number of Years The Park has Operated [year]
P_A          - The Price of Addmission [$/person]
P_W          - People Estimated to Visit The Zoo per week [person/week]
E_D_W        - The Expected Donations per week [$/week]
V_C          - The Operational (Variable) Cost in [$/week]
T_C          - Calculating The Total Cost [$]
Y_T_C        - Calculating The Total Yearly Cost [$/year]
Rev          - Calculating The Revenue [$]
R_slope      - The Slope of The Revenue [$/week]
Prof         - The Profit in [$]
T_C_N        - The Total Cost For The Number of Years [$]
V_C_Y        - The Variable Cost per Year [$/year]
Rev_N        - The Revenue For The Number of Years [$]
Prof_N       - The Profit For The Number of Years [$]
B_point_year - The Breakeven Point in [years]
Y_point_BE_R - The Corresponding Point for the breakeven time by using Revenue Function [$]
Y_point_BE_C - The Corresponding Point for the breakeven time by using Cost Function [$]
Donations_Break - the amount of the one-time donation necessary to breakeven in seven months.
%}

%Initializing a Menu to Prompt The User

construction_materials={'Concrete' 16 30 96000 900 5 5;...               %Storing The 3 construction materials and their costs in a cell array
'Wood' 23 53 115000 800 12 11;'Adobe' 18 42 68000 600 6 5};

material_choice = menu('Select Material',construction_materials{1,1},... %Prompting the user to choose a material
    construction_materials{2,1},construction_materials{3,1});

%Storing intermediate values for the Fixed Cost

SA = 3000;                                                % Surface Area of the Wall in [ft^2]

M_N = construction_materials{material_choice,1};          % Material Name

T_W = construction_materials{material_choice,2};          % Thickness of the wall in [ft]

M_C = construction_materials{material_choice,3};          % Material cost [$/ft^3]

MC_Materials = construction_materials{material_choice,4}; % Cost of Miscellaneous construction materials [$]

L_C = construction_materials{material_choice, 5};         % Labor cost in [$/(Person * week)]

NO_L= construction_materials{material_choice, 6};         % Amount of people working [Person]

W_C = construction_materials{material_choice, 7};         % Number of weeks of construction [Weeks]

% Calculating the Total Fixed Cost

C_M = ((SA * (T_W/12) * M_C) + MC_Materials);             % Cost for all material services [$]

C_L = (L_C * NO_L * W_C);                                 % Total cost of paying all laborers [$]

F_C = C_M +C_L;                                           % Total Fixed Cost of the Operation [$]

%Storing intermediate values for the Operational (Variable) Cost

E_C = input('Please Enter The Cost of Energy per week: ');                    %Prompting The User for the Operational Cost of Energy in [$/week]

L_O_C = input('Please Enter The Cost of Labor per week: ');                   %Prompting The User for the Operational Cost of Labor in [$/week]

M_O_C = input('Please Enter The Cost of Maintanence per week: ');             %Prompting The User for the Operational Cost of Maintanence in [$/week]

LA_C = input('Please Enter The Cost of LandFill per week: ');                 %Prompting The User for the Operational Cost of LandFill in [$/week]

W_R_Z = input('Please Enter The weeks The Zoo Will Operate per year: ');      %Prompting The User to Enter Operational Weeks per Year [weeks/year]

NO_YO = input('Please Enter The Number of Years The Park has Operated: ');    %Prompting The User to Enter The Number of Years The Park has Operated [year]

Y_array = (0:NO_YO);                                                          %All The Years Since Opening

%Storing intermediate values for the Revenue

P_A = input('Please Enter Price of Admission per person: ');                          %Prompting The User to Enter The Price of Addmission [$/person]

P_W = input('Please Enter The Estimated People to Visit The Zoo per week: ');         %Prompting The User to Enter The People Estimated to Visit The Zoo per week [person/week]

E_D_W = input('Please Enter The Expected Donations per week: ');                      %Prompting The User to Enter The Expected Donations per week [$/week]

%Calculating Revenue,Profit and Total Cost For Running The Zoo

V_C = E_C + L_O_C + LA_C + M_O_C;                       %Calculating The Operational (Variable) Cost in [$/week]
T_C = F_C + (V_C * W_R_Z * NO_YO);                      %Calculating The Total Cost [$]
Y_T_C= ( V_C * W_R_Z );                                 %Calculating Yearly Total Cost [$/year]

Rev= ((P_A * P_W) + (E_D_W)) * W_R_Z * NO_YO;           %Calculating The Revenue [$]
R_slope= ((P_A * P_W) + E_D_W);                         %Calculating The Slope of The Revenue [$/week]

Prof= (Rev - T_C);                                      %Calculating The Profit in [$]

%Calculating Revenue,Profit and Total Cost For Running The Zoo For The Number Of Years Operated

T_C_N = F_C + (V_C * W_R_Z * Y_array);                   %Calculating The Total Cost For The Number of Years [$]
V_C_Y = V_C * W_R_Z ;                                    %Calculating The Variable Cost per Year [$/year]

Rev_N = ((P_A * P_W) + (E_D_W)) * W_R_Z * Y_array;       %Calculating The Revenue For The Number of Years [$]

Prof_N = (Rev_N - T_C_N);                                %Calculating The Profit For The Number of Years [$]

%Calculating The Breakeven Point

B_point_years = F_C / ((R_slope * W_R_Z) - V_C_Y);       %Calculating The breakeven point in [years]
B_point_month = B_point_years * (12);                    %Calculating The breakeven point in [months]

Y_point_BE_R = (R_slope * W_R_Z) * (B_point_years);      %Calculating The Corresponding Point for the breakeven time by using Revenue Function [$]

Y_point_BE_C = V_C * W_R_Z * B_point_years + F_C;        %Calculating The Corresponding Point for the breakeven time by using Cost Function [$]

Y_Profit = Y_point_BE_R - Y_point_BE_C;                  %Calculating The Corresponding Point for the breakeven time For Profit [$]

%Printing The Evaluation of The Material Entered

fprintf('Material: %s\n\tOperating %d weeks per year will generate per year:',M_N,W_R_Z);
fprintf('\n\t\tRevenue:\t$%0.0f',Rev/NO_YO);
fprintf('\n\t\tCost:\t\t$%0.0f',Y_T_C);
fprintf('\n\t\tThe breakeven time is %0.2f months',B_point_month);
fprintf('\n\tThe Total Profit after %0.0f years is $%0.3e.\n',NO_YO,Prof);

%finding for the amount of the one-time donation necessary to breakeven in seven months.
Donations_Break = T_C_N * (7/12) - Rev_N * (7/12);

%Printing the amount of the one-time donation necessary to breakeven in seven months.

fprintf('\nIt will take a one-time donation of $%0.2f to breakeven in seven months.\n',Donations_Break(1));


%Plotting The Graph Describing The Revnue and Cost with Respect to Time

figure('Color','w');

plot(Y_array,Rev_N,'-r',Y_array,T_C_N,'-g');                   %Plotting The Revenue Line and The Cost Line With Respect To Time in Years

hold on;                                                       %Attaching The graphs Together

plot(B_point_years,Y_point_BE_R,'ok','MarkerFaceColor','k');   %Plotting The breakeven Point

title('Breakeven Analysis for creating a new viewing habitat');%Setting A Label for the Title

xlabel('Time (t) [Y]');                                        %Setting A Label for the abscissa

ylabel('Money (m) [$]');                                       %Setting A Label for the ordinate  
   
LT = {'Revenue','Cost'};                                       %Describing The Lines Graphed Using A Legend
     
L = legend(LT,'location','best');                              %Setting the Legend to The Best Location

grid on;                                                       %Setting Gridlines On
 
%Plotting The Graph Describing The Profit Made With Respect to Time

figure('Color','w');

plot(Y_array,Prof_N,'-b');                                                     %Plotting The Profit Line With Respect To Time in Years

hold on;                                                                       %Attaching The graphs Together

plot(B_point_years,Y_Profit,'or','MarkerFaceColor','k');                       %Plotting The breakeven Point

xlabel('Time (t) [Y]');                                                        %Setting A Label for the abscissa 

ylabel('Profit (P) [$]');                                                      %Setting A Label for the ordinate  

title('The Profit Of The Zoo Over Time');                                      %Setting A Label for the Title

grid on;                                                                       %Setting Gridlines On




