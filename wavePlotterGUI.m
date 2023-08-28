function wavePlotterGUI()
    % Create the GUI figure
    fig = figure('Name', 'Wave Plotter GUI', 'NumberTitle', 'off', 'Position', [100 100 400 400]);

    % Create UI components
    frequencyLabel = uicontrol('Style', 'text', 'String', 'Frequency:', 'Position', [20 350 80 20]);
    frequencyTextBox = uicontrol('Style', 'edit', 'Position', [100 350 80 20]);
    
    sinButton = uicontrol('Style', 'pushbutton', 'String', 'Sin Wave', 'Position', [20 300 80 20], 'Callback', @plotSinWave);
    squareButton = uicontrol('Style', 'pushbutton', 'String', 'Square Wave', 'Position', [120 300 100 20], 'Callback', @plotSquareWave);
    sawtoothButton = uicontrol('Style', 'pushbutton', 'String', 'Sawtooth Wave', 'Position', [250 300 100 20], 'Callback', @plotSawtoothWave);
    rectangularButton = uicontrol('Style', 'pushbutton', 'String', 'Rectangular Wave', 'Position', [20 250 120 20], 'Callback', @plotRectangularWave);
    laplaceButton = uicontrol('Style', 'pushbutton', 'String', 'Laplace', 'Position', [150 250 80 20], 'Callback', @plotLaplace);
    invLaplaceButton = uicontrol('Style', 'pushbutton', 'String', 'Inverse Laplace', 'Position', [250 250 120 20], 'Callback', @plotInverseLaplace);
    
    % Callback functions for each button
    function plotSinWave(~, ~)
        frequency = str2double(frequencyTextBox.String);
        time = 0:0.001:1;
        amplitude = sin(2*pi*frequency*time);
        plotWave(time, amplitude, 'Sin Wave');
    end

    function plotSquareWave(~, ~)
        frequency = str2double(frequencyTextBox.String);
        time = 0:0.001:1;
        amplitude = square(2*pi*frequency*time);
        plotWave(time, amplitude, 'Square Wave');
    end

    function plotSawtoothWave(~, ~)
        frequency = str2double(frequencyTextBox.String);
        time = 0:0.001:1;
        amplitude = sawtooth(2*pi*frequency*time);
        plotWave(time, amplitude, 'Sawtooth Wave');
    end

    function plotRectangularWave(~, ~)
        frequency = str2double(frequencyTextBox.String);
        time = 0:0.001:1;
        dutyCycle = 0.5;
        amplitude = square(2*pi*frequency*time, dutyCycle);
        plotWave(time, amplitude, 'Rectangular Wave');
    end

    function plotLaplace(~, ~)
        frequency = str2double(frequencyTextBox.String);
        time = 0:0.001:1;
        amplitude = exp(-frequency*time);
        plotWave(time, amplitude, 'Laplace');
    end

    function plotInverseLaplace(~, ~)
        frequency = str2double(frequencyTextBox.String);
        time = 0:0.001:1;
        amplitude = 1 - exp(-frequency*time);
        plotWave(time, amplitude, 'Inverse Laplace');
    end

    function plotWave(time, amplitude, waveName)
        clf(fig);
        plot(time, amplitude);
        xlabel('Time');
        ylabel('Amplitude');
        title(waveName);
    end
end