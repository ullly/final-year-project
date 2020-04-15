%dipped_script Plots graphs of dipped hue results
%    Dipped Script plots hue on the y-axis and pH on the x-axis.

%    Each array has five entries as five strips were dipped
lj_avg1 = [42.905334 40.861313 42.34009 40.876854 42.343792];
lj_avg2 = [39.886948 38.94453 38.901917 38.730175 40.113712];
lj_avg3 = [94.321434 94.18142 92.95952 93.41465 94.48364];
lj_avg4 = [47.23251 45.9022 45.786427 45.68819 46.451935];

ph4_avg1 = [27.493992 32.4066 27.226065 29.109753 31.388393];
ph4_avg2 = [41.994495 41.642437 42.688614 43.190674 45.66204];
ph4_avg3 = [79.408066 78.98544 80.2228 78.15818 81.634026];
ph4_avg4 = [46.996086 47.02493 46.78795 47.67397 48.01656];

co_avg1 = [271.14188 286.63 297.2 286.7 287.3];
co_avg2 = [43.43376 45.2 44.32 45.0 44.8];
co_avg3 = [64.876434 65.4 64.2 64.5 64.2];
co_avg4 = [41.400677 41.0 41.9 41.2 40.8];

ph7_avg1 = [237.89304 236.44052 233.62495 235.9363 238.42383];
ph7_avg2 = [74.767105 73.80891 74.61206 75.9802 74.14285];
ph7_avg3 = [78.46771 77.892746 79.80085 79.4344 78.968636];
ph7_avg4 = [46.720802 47.01659 47.09174 47.02699 46.62464];

bs_avg1 = [241.66821 242.3101 243.13698 243.32214 243.2029];
bs_avg2 = [142.01382 139.56651 150.6934 163.35167 160.20146];
bs_avg3 = [78.61345 80.472755 79.50516 78.725685 79.76451];
bs_avg4 = [44.311626 44.87922 43.81647 43.57295 43.571857];

ph9_avg1 = [242.9 245.9 245.7 243.5 245.4];
ph9_avg2 = [205.5 210.1 207.0 206.7 206.0];
ph9_avg3 = [79.5 69.2 66.6 69.2 65.6]; % Jump in first element due to running of colour
ph9_avg4 = [41.7 40.6 40.7 40.3 40.1];

ph10_avg1 = [247.37201 247.84468 247.21715 246.80443 247.19846];
ph10_avg2 = [216.63863 213.22525 220.9043 214.55997 216.72197];
ph10_avg3 = [350.89166 352.9898 353.28287 350.06735 350.6086];
ph10_avg4 = [35.058643 35.41049 34.426647 35.94569 35.27462];

% lj ------

figure(1);
x = [1 2 3 4 5];
bar(x, lj_avg1, 'k');
grid on;
title('Lemon Juice: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-lj-1','-dpng')

figure(2);
x = [1 2 3 4 5];
bar(x, lj_avg2, 'k');
grid on;
title('Lemon Juice: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-lj-2','-dpng')

figure(3);
x = [1 2 3 4 5];
bar(x, lj_avg3, 'k');
grid on;
title('Lemon Juice: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-lj-3','-dpng')

figure(4);
x = [1 2 3 4 5];
bar(x, lj_avg4, 'k');
grid on;
title('Lemon Juice: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-lj-4','-dpng')

% ph 4 ------

figure(5);
x = [1 2 3 4 5];
bar(x, ph4_avg1, 'k');
grid on;
title('pH 4 Buffer Solution: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-4-1','-dpng')

figure(6);
x = [1 2 3 4 5];
bar(x, ph4_avg2, 'k');
grid on;
title('pH 4 Buffer Solution: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-4-2','-dpng')

figure(7);
x = [1 2 3 4 5];
bar(x, ph4_avg3, 'k');
grid on;
title('pH 4 Buffer Solution: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-4-3','-dpng')

figure(8);
x = [1 2 3 4 5];
bar(x, ph4_avg4, 'k');
grid on;
title('pH 4 Buffer Solution: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-4-4','-dpng')

% co ------

figure(9);
x = [1 2 3 4 5];
bar(x, co_avg1, 'k');
grid on;
title('Coffee: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-co-1','-dpng')

figure(10);
x = [1 2 3 4 5];
bar(x, co_avg2, 'k');
grid on;
title('Coffee: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-co-2','-dpng')

figure(11);
x = [1 2 3 4 5];
bar(x, co_avg3, 'k');
grid on;
title('Coffee: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-co-3','-dpng')

figure(12);
x = [1 2 3 4 5];
bar(x, co_avg4, 'k');
grid on;
title('Coffee: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-co-4','-dpng')

% ph 7 ------

figure(13);
x = [1 2 3 4 5];
bar(x, ph7_avg1, 'k');
grid on;
title('pH 7 Buffer Solution: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-7-1','-dpng')

figure(14);
x = [1 2 3 4 5];
bar(x, ph7_avg2, 'k');
grid on;
title('pH 7 Buffer Solution: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-7-2','-dpng')

figure(15);
x = [1 2 3 4 5];
bar(x, ph7_avg3, 'k');
grid on;
title('pH 7 Buffer Solution: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-7-3','-dpng')

figure(16);
x = [1 2 3 4 5];
bar(x, ph7_avg4, 'k');
grid on;
title('pH 7 Buffer Solution: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-7-4','-dpng')

% bs ------

figure(17);
x = [1 2 3 4 5];
bar(x, bs_avg1, 'k');
grid on;
title('Baking Soda: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-bs-1','-dpng')

figure(18);
x = [1 2 3 4 5];
bar(x, bs_avg2, 'k');
grid on;
title('Baking Soda: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-bs-2','-dpng')

figure(19);
x = [1 2 3 4 5];
bar(x, bs_avg3, 'k');
grid on;
title('Baking Soda: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-bs-3','-dpng')

figure(20);
x = [1 2 3 4 5];
bar(x, bs_avg4, 'k');
grid on;
title('Baking Soda: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-bs-4','-dpng')

% ph 9 ------

figure(21);
x = [1 2 3 4 5];
bar(x, ph9_avg1, 'k');
grid on;
title('pH 9 Buffer Solution: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-9-1','-dpng')

figure(22);
x = [1 2 3 4 5];
bar(x, ph9_avg2, 'k');
grid on;
title('pH 9 Buffer Solution: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-9-2','-dpng')

figure(23);
x = [1 2 3 4 5];
bar(x, ph9_avg3, 'k');
grid on;
title('pH 9 Buffer Solution: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-9-3','-dpng')

figure(24);
x = [1 2 3 4 5];
bar(x, ph9_avg4, 'k');
grid on;
title('pH 9 Buffer Solution: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-9-4','-dpng')

% ph 10 ------

figure(25);
x = [1 2 3 4 5];
bar(x, ph10_avg1, 'k');
grid on;
title('pH 10 Buffer Solution: Average Hue Value of Panel 1')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-10-1','-dpng')

figure(26);
x = [1 2 3 4 5];
bar(x, ph10_avg2, 'k');
grid on;
title('pH 10 Buffer Solution: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-10-2','-dpng')

figure(27);
x = [1 2 3 4 5];
bar(x, ph10_avg3, 'k');
grid on;
title('pH 10 Buffer Solution: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-10-3','-dpng')

figure(28);
x = [1 2 3 4 5];
bar(x, ph10_avg4, 'k');
grid on;
title('pH 10 Buffer Solution: Average Hue Value of Panel 4')
xlabel("Picture Number"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-script-10-4','-dpng')


