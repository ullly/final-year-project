%hue_script_detail Creates a hue-pH curve
%    Hue Script plots hue on the y-axis and pH on the x-axis.

panelRowOne = [22.6 28.6 32.4 39.4 39.4 42.4 47.0 54.5 62.9 68.5 83.5 130.7 174.2 187.4];
panelRowTwo = [52.4 53.4 58.2 59.6 62.5 65.4 70.4 78.2 90.7 100.6 126.5 129.5 180.2 210.7];

allPanels = [panelRowOne; panelRowTwo];

added = sum(allPanels);

figure(1);
bar(added, 'k'); 
set(gca,'XTick',1:14);
set(gca,'XTickLabel',{'4.5','5.0','5.5','5.75', '6.0', '6.25', '6.5', '6.75', '7.0', '7.25', '7.5', '8.0', '8.5', '9.0'})
%title('Reference sheet - Panels Summed')
xlabel("pH"); 
ylabel("Hue (degrees) summed");
grid on;
print('../figures/sum-detail-bar','-dpng')

figure(2);
plot(added, 'k'); 
set(gca,'XTick',1:14);
set(gca,'XTickLabel',{'4.5','5.0','5.5','5.75', '6.0', '6.25', '6.5', '6.75', '7.0', '7.25', '7.5', '8.0', '8.5', '9.0'})
title('Reference sheet - Panels Summed')
xlabel("pH"); 
ylabel("Hue (degrees) summed");
grid on;
print('../figures/sum-detail-plot','-dpng')