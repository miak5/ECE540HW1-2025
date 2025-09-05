function FinalPrecision()
%My function FinalPrecision calculates the precision values for decreasing base values. 
%In our assignment we start the base at 1 and then decrease it until its 1-e30
%At the end of the function the results are stored into a CSV file and are plotted. 

%Input- none
%Output- plots and results written in CSV file
%Purpose- Shows how precision changes with base values


BaseValue = 1; %intialize base value
ResultsMatrix = []; %initializing results matrix

PrecisionValue = PrecisionVersusBase(BaseValue);
%file = fopen ('precision_results.csv','w');

%loop base until its 1e-30
while BaseValue >= 1e-30
    PrecisionValue = PrecisionVersusBase(BaseValue); %calling previous function for precision value
    RowMatrix = [BaseValue, PrecisionValue, PrecisionValue / BaseValue]; %Store results in matrix
    ResultsMatrix = [ResultsMatrix; RowMatrix]; %Add row results to matrix
    BaseValue = BaseValue / 2; %Update BaseValue and halve it
end %End the while loop

%Save my results to the CSV file
writematrix(ResultsMatrix, 'PrecisionBaseResults.csv'); %save results to CSV file

%Plot Base Versus Precision
figure;
loglog(ResultsMatrix(:, 1 ),ResultsMatrix(:, 2 )), xlabel('Base'), ylabel('Precision'), title('Base vs Precision');
set(gca, 'XDir', 'reverse'); %Reverse Direction of X axis 

%Plot Base Versus Ratio
figure;
loglog(ResultsMatrix(:, 1 ), ResultsMatrix(:, 3 )), xlabel('Base'), ylabel('Ratio'), title('Base vs Ratio');
set(gca, 'XDir', 'reverse'); %Reverse Direction of X axis  

