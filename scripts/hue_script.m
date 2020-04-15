%hue_script Creates a hue-pH curve
%    Hue Script plots hue on the y-axis and pH on the x-axis.

% Each matrix below contains 90 entries. A row contains average hue
% values from pH 0 to pH 14. These averages were obtained from a photo of
% a pH reference sheet panel.

% There were six pictures taken, hence there are six rows.

% There are four matrices because each pH value has four panels. 

panelRowOne = [25.2 35.1 39.8 35.3 16.8 234.0 234.4 234.9 236.6 238.5 238.4 238.6 238.6 239.1 239.5;%pic one
    27.2 35.0 38.8 34.6 14.3 241.6 236.8 236.8 234.1 237.8 238.0 238.3 238.4 238.8 239.7; %pic two
    27.4 35.9 40.5 34.8 21.8 239.7 238.0 238.0 237.4 239.8 239.6 238.7 238.6 237.8 238.4; % pic three
    26.3 35.1 40.1 35.3 16.8 237.1 235.9 236.3 239.0 239.9 240.2 240.4 239.9 239.4 238.8; % pic four
    27.8 35.6 40.1 35.4 16.6 235.8 235.3 235.1 237.2 238.8 239.3 239.7 239.5 238.6 238.4; % pic five
    28.7 36.8 41.5 37.0 22.1 234.9 233.9 233.1 237.1 239.3 239.2 238.8 238.9 238.8 238.6]; %pic six

panelRowTwo = [45.8 46.1 50.6 51.2 51.2 55.0 62.8 76.7 137.0 187.6 214.1 213.2 213.4 213.8 214.0;
    45.8 46.2 50.4 50.5 50.4 54.3 62.1 76.1 139.0 183.9 212.3 211.6 212.2 212.1 213.3;
    46.9 47.0 50.9 50.5 50.2 54.3 62.7 78.2 134.1 185.4 214.3 214.5 213.4 214.1 214.4;
    46.1 46.4 51.0 51.0 51.0 54.5 62.2 75.5 133.3 193.1 215.1 215.0 214.7 214.2 214.8;
    46.4 46.8 51.2 51.5 51.6 55.5 63.0 76.7 133.7 183.1 213.8 213.8 214.3 214.4 214.0;
    47.7 48.0 52.4 52.6 52.3 55.6 63.3 78.5 137.0 187.0 214.7 214.1 213.3 213.8 213.5];

panelRowThree = [82.3 82.5 72.4 73.4 73.4 73.3 73.0 71.9 71.7 68.3 16 348.3 349.4 351.2 352.3;
    82.4 81.0 69.7 69.7 70.3 71.0 71.3 71.8 73.5 68.7 18.6 349.3 350.0 351.7 353.1;
    85.2 84.5 71.9 71.0 70.9 71.2 71.8 72.5 70.8 66.6 15.7 348.1 348.5 350.2 351.7;
    81.1 83.1 72.8 73.0 72.3 72.0 71.1 70.6 72.5 69.5 15.8 348.1 349.1 350.6 351.5;
    84.9 83.8 72.5 72.7 72.6 73.0 73.2 73.4 73.3 68.5 17.8 348.0 349.1 350.5 351.5;
    83.9 84.6 72.9 73.4 72.9 72.8 72.9 73.9 73.0 67.6 16.5 347.4 348.7 350.2 351.3];

panelRowFour = [49.0 49.6 50.1 50.5 51.0 50.4 52.9 52.6 52.2 48.3 48.5 40.6 34.0 19.4 5.6;
    49.7 49.7 49.6 49.4 50.4 50.0 53.2 53.3 53.8 49.7 49.2 40.9 34.8 20.3 5.9;
    50.5 50.5 50.3 50.1 50.1 49.3 52.4 52.0 51.8 47.5 47.6 40.4 34.1 19.8 5.1;
    49.0 49.9 50.4 50.8 50.9 50.0 52.5 52.1 51.3 47.2 47.1 39.0 33.0 18.7 4.8;
    50.6 50.7 50.8 51.0 51.4 51.1 54.0 54.0 52.7 47.8 47.9 39.6 34.1 19.0 5.1;
    51.1 51.6 51.9 52.0 52.2 51.5 54.5 54.7 53.3 49.1 49.1 40.6 34.6 19.7 5.2];

meanPanelRow1 = mean(panelRowOne);
meanPanelRow2 = mean(panelRowTwo);
meanPanelRow3 = mean(panelRowThree);
meanPanelRow4 = mean(panelRowFour);

standardDeviationPanelRow1 = std(panelRowOne);
standardDeviationPanelRow2 = std(panelRowTwo);
standardDeviationPanelRow3 = std(panelRowThree);
standardDeviationPanelRow4 = std(panelRowFour);

pH = 0:1:14;

% Plot curves on the one graph 
figure(1)

errorbar(pH,meanPanelRow1,standardDeviationPanelRow1,'k-o');

%title('Plot of Reference Sheet Average Hue Values')
xlabel("pH"); 
ylabel("Hue (degrees)");
xticks(0:14);
yticks(0:50:360);
grid on;

hold on;

errorbar(pH,meanPanelRow2,standardDeviationPanelRow2,'k-s');
errorbar(pH,meanPanelRow3,standardDeviationPanelRow3,'k-d');
errorbar(pH,meanPanelRow4,standardDeviationPanelRow4,'k-*');

legend({'Row 1','Row 2', 'Row 3', 'Row 4'},'Location','northwest');

hold off;

print('../figures/cal-curve-0','-dpng')

% Plot curves on separate graphs

figure(2);
errorbar(pH,meanPanelRow1,standardDeviationPanelRow1,'k-o');
%title('Plot of Reference Sheet Average Hue Values (Row One)')
xlabel("pH"); 
ylabel("Hue (degrees)");
grid on;
print('../figures/cal-curve-r1','-dpng')

figure(3)
errorbar(pH,meanPanelRow2,standardDeviationPanelRow2,'k-s');
%title('Plot of Reference Sheet Average Hue Values (Row Two)')
xlabel("pH"); 
ylabel("Hue (degrees)");
grid on;
print('../figures/cal-curve-r2','-dpng')

figure(4)
errorbar(pH,meanPanelRow3,standardDeviationPanelRow3,'k-d');
%title('Plot of Reference Sheet Average Hue Values (Row Three)')
xlabel("pH"); 
ylabel("Hue (degrees)");
grid on;
print('../figures/cal-curve-r3','-dpng')

figure(5)
errorbar(pH,meanPanelRow4,standardDeviationPanelRow4,'k-*');
%title('Plot of Reference Sheet Average Hue Values (Row Four)')
xlabel("pH"); 
ylabel("Hue (degrees)");
grid on;
print('../figures/cal-curve-r4','-dpng')




