%dipped_script_range Plots graphs of dipped hue results
%    Dipped Script Range shows if average is in range to match.
%    Range is based on pH / hue curve

%    Each array has five entries as five strips were dipped

co_avg2 = [43.43376 45.2 44.32 45.0 44.8];

ph7_avg2 = [74.767105 73.80891 74.61206 75.9802 74.14285];

bs_avg2 = [142.01382 139.56651 150.6934 163.35167 160.20146];

ph9_avg2 = [205.5 210.1 207.0 206.7 206.0];

ph10_avg3 = [350.89166 352.9898 353.28287 350.06735 350.6086];

% co ------

figure(1);
x = [1 2 3 4 5];
bar(x, co_avg2, 'k');
grid on;
title('Coffee: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value");
yline(1,'-.b', 'pH 5 Cal Low');
yline(134.285,'-.b', 'Ph 5 Cal High');
print('../figures/dipped-range-co','-dpng')

% ph 7 ------

figure(2);
x = [1 2 3 4 5];
bar(x, ph7_avg2, 'k');
grid on;
title('pH 7 Buffer Solution: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (Degrees)");
yline(69.815,'-.b', 'pH 7 Cal Low');
yline(106.325,'-.b', 'pH 7 Cal High');
print('../figures/dipped-range-7','-dpng')

% bs ------

figure(3);
x = [1 2 3 4 5];
bar(x, bs_avg2, 'k');
grid on;
title('Baking Soda: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (Degrees)");
yline(106.325,'-.b', 'pH 8 Cal Low');
yline(161.2,'-.b', 'pH 8 Cal High / pH 9 Cal Low');
yline(200.4,'-.b', 'pH 9 Cal High');
print('../figures/dipped-range-bs','-dpng')

% ph 9 ------

figure(4);
x = [1 2 3 4 5];
bar(x, ph9_avg2, 'k');
grid on;
title('pH 9 Buffer Solution: Average Hue Value of Panel 2')
xlabel("Picture Number"); 
ylabel("Hue Value (Degrees)");
yline(161.2,'-.b', 'pH 9 Cal Low');
yline(200.4,'-.b', 'pH 9 Cal High');
print('../figures/dipped-range-9','-dpng')

% ph 10 ------

figure(5);
x = [1 2 3 4 5];
bar(x, ph10_avg3, 'k');
grid on;
title('pH 10 Buffer Solution: Average Hue Value of Panel 3')
xlabel("Picture Number"); 
ylabel("Hue Value (Degrees)");
yline(349.975,'-.b', 'pH 10 Cal Low');
yline(42.464,'-.b', 'Ph 10 Cal High');
print('../figures/dipped-range-10','-dpng')



