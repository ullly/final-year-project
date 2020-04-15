%pack_conparisons Plots hue pH readings side by side
%    Looks at similarity between readings from different packs

% Lemon Juice
lemonJuiceNew = [39.6 40 91.2 45.7];
lemonJuiceNewSum = sum(lemonJuiceNew);

lemonJuiceOld = [42.905334 39.886948 94.321434 47.23251];
lemonJuiceOldSum = sum(lemonJuiceOld);

% pH4
pH4New = [25.7 42.6 80.4 46.4];
pH4NewSum = sum(pH4New);

pH4Old = [27.493992 41.994495 79.408066 46.996086];
pH4OldSum = sum(pH4Old);

% Coffee
coffeeNew = [266.6 43.1 62.6 40.2];
coffeeNewSum = sum(coffeeNew);

coffeeOld = [271.14188 43.43376 64.876434 41.400677];
coffeeOldSum = sum(coffeeOld);

% pH7
pH7New = [237.8 79.7 76.0 46.7];
pH7NewSum = sum(pH7New);

pH7Old = [237.89304 74.767105 78.46771 46.720802];
pH7OldSum = sum(pH7Old);

% Baking Soda
bakingSodaNew = [242.6 178.8 78.4 43.5];
bakingSodaNewSum = sum(bakingSodaNew);

bakingSodaOld = [241.66821 142.01382 78.61345 44.311626];
bakingSodOldSum = sum(bakingSodaOld);

% pH9
pH9New = [245.9 209.8 65.5 41.9];
pH9NewSum = sum(pH9New);

pH9Old = [242.9 205.5 79.5 41.7];
pH9OldSum = sum(pH9Old);

% pH10
pH10New = [246.8 218.2 347.1 33.9];
pH10NewSum = sum(pH10New);

pH10Old = [247.37201 216.63863 350.89166 35.058643];
pH10OldSum = sum(pH10Old);

% Not dipped
notDippedNew = [226.7 54.2 78.2 41.4];
notDippedNewSum = sum(notDippedNew);

notDippedOld = [226.7 54.4 80.7 40.2];
notDippedOldSum = sum(notDippedOld);

% Plot on a single bar chart
y = [lemonJuiceNewSum lemonJuiceOldSum;
    pH4NewSum pH4OldSum;
    coffeeNewSum coffeeOldSum;
    pH7NewSum pH7OldSum;
    bakingSodaNewSum bakingSodOldSum;
    pH9NewSum pH9OldSum;
    pH10NewSum pH10OldSum];

figure(1);
bar(y); 
%title('Pack Comparison - Range of Different Solutions');
legend({'Pack 1','Pack 2'},'Location','northwest');
set(gca,'XTick',1:7)
set(gca,'XTickLabel',{'LJ','B4','CO','B7', 'BS', 'B9', 'B10'})
xlabel("Solution"); 
ylabel("Hue (degrees) summed");
grid on;
print('../figures/pack-comparison','-dpng');


