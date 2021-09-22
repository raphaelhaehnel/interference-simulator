function draw_waves(t0, x, y, wave, display, UIAxes)
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
    
    % Plot the surface of the real part or the absolute part of the wave
    if isequal(display, 'real')
        surf(UIAxes, x, y, real(f(t0, xx, yy)));
        colormap(UIAxes, turbo);
    elseif isequal(display, 'abs')
        surf(UIAxes, x, y, abs(f(t0, xx, yy)).^2);
    else
        error('Wave display must be ''real'' or ''abs''');
    end
    
    shading(UIAxes, 'interp');
    view(UIAxes, 2);
    colorbar(UIAxes);
end

