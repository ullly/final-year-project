%dipped_script_acquisition Plots graphs of dipped hue results
%    Dipped Script plots hue on the y-axis and pH on the x-axis.

%    Each array has seven entries as seven strips were dipped

% index 1 to 6: lj, pH 4, co, pH7, bs, pH9, pH10 (from seven images)
avg1 = [42.905334 27.493992 271.14188 237.89304 241.66821 242.9 247.37201];
avg2 = [39.886948 41.994495 43.43376 74.767105 142.01382 205.5 216.63863];
avg3 = [94.321434 79.408066 64.876434 78.46771 78.61345 79.5 350.89166];
avg4 = [47.23251 46.996086 41.400677 46.720802 44.311626 41.7 35.058643];

figure(1);
x = [1 2 3 4 5 6 7];
bar(x, avg1,'k');
%title('Average Hue Value of Panel 1 for Seven Different Solutions')
set(gca,'XTick',1:7)
set(gca,'XTickLabel',{'LJ','B4','CO','B7', 'BS', 'B9', 'B10'})
xlabel("Solution"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-acq-1','-dpng')

figure(2);
x = [1 2 3 4 5 6 7];
bar(x, avg2, 'k');
%title('Average Hue Value of Panel 2 for Seven Different Solutions')
set(gca,'XTick',1:7)
set(gca,'XTickLabel',{'LJ','B4','CO','B7', 'BS', 'B9', 'B10'})
xlabel("Solution"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-acq-2','-dpng')

figure(3);
x = [1 2 3 4 5 6 7];
bar(x, avg3, 'k');
%title('Average Hue Value of Panel 3 for Seven Different Solutions')
set(gca,'XTick',1:7)
set(gca,'XTickLabel',{'LJ','B4','CO','B7', 'BS', 'B9', 'B10'})
xlabel("Solution"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-acq-3','-dpng')

figure(4);
x = [1 2 3 4 5 6 7];
bar(x, avg4, 'k');
%title('Average Hue Value of Panel 4 for Seven Different Solutions')
set(gca,'XTick',1:7)
set(gca,'XTickLabel',{'LJ','B4','CO','B7', 'BS', 'B9', 'B10'})
xlabel("Solution"); 
ylabel("Hue Value (degrees)");
print('../figures/dipped-acq-4','-dpng')
