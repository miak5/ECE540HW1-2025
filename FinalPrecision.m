function FinalPrecision()
%this 


BaseValue = 1; %intialize base value
ResultsMatrix = []; %initializing results matrix

PrecisionValue = PrecisionVersusBase(BaseValue);
%file = fopen ('precision_results.csv','w');

%loop base until its below 1e-30
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
