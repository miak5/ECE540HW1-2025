function FinalPrecision()
base=1; %intro base

ResultsMatrix=[]; %initializing results matrix

precision = PrecisionVersusBase(base);
%file = fopen ('precision_results.csv','w');
while base>=(1e-30)
    precision = PrecisionVersusBase(base); %calling previous function for precision value
    RowMatrix= [precision, base, precision/base]; %store in matrix
    ResultsMatrix= [ResultsMatrix;RowMatrix]; %add row results to matrix
    base= base/2;
end

writematrix(ResultsMatrix, 'PrecisionBaseResults.csv'); %save results to CSV file

figure;
loglog(ResultsMatrix(:, 1 ),ResultsMatrix(:, 2 )), xlabel('Base'), ylabel('Precision'), title('Base vs Precision');
set(gca, 'XDir', 'reverse'); %Reverse Direction of X axis 

figure;
loglog(ResultsMatrix(:, 1 ), ResultsMatrix(:, 3 )), xlabel('Base'), ylabel('Ratio'), title('Base vs Ratio');
set(gca, 'XDir', 'reverse'); %Reverse Direction of X axis  