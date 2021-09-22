function t_end = simulate_wave(T, t0, x, y, wave, UIAxes)
%DRAW_WAVES Plot the wave object on the given axes
%   DRAW_WAVES(t, x, y, wave, display, UIAxes). x and y are some vectors, t
%   is time, wave might be a Wave object or a function_handle object,
%   display must be 'real' or 'abs', and UIAxes is the axes on wich the
%   function is plotting the graph
    

    % Check if the wave is a function_handle object or a Wave object
    if isequal(class(wave), 'Wave')
        f = wave.f;
    elseif isequal(class(wave), 'function_handle')
        f = wave;
    else
        error('The wave argument is not a valid');
    end
    
    % Generate a meshgrid to display the wave on it
    [xx, yy] = meshgrid(x, y);
    
    % FPS = 1/T ~ 28.6
    dt = 0.035;
    N = floor(T/dt);
    
    % Plot the data a first time
    s = surf(UIAxes, x, y, real(f(t0, xx, yy)));
    colormap(UIAxes, turbo);
    shading(UIAxes, 'interp');
    view(UIAxes, 2);
    colorbar(UIAxes);
    
    tic    
    for i=1:N
        Z = real(f(t0 + i*0.005, xx, yy)); % Recompute the z-axis 
        set(s, 'ZData', Z); % Change only the z-values of the surf plot
        drawnow
%         pause(dt);
    end
    toc
    
    t_end = t0 + N*0.005;
    
end

