function niceplot(X1, Y1,title1,ylabel1,xlabel1)

% Create a figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');

% Create plot
plot(X1,Y1,'Marker','+');

% Create title
title(title1,'FontSize',18);

% Create ylabel
ylabel(ylabel1,'FontSize',18);

% Create xlabel
xlabel(xlabel1,'FontSize',18);

