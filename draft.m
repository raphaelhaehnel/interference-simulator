%% Unit test 1
x = linspace(-5, 5, 3000);
y = linspace(-5, 5, 3000);
wave1 = Wave(pi/4, 100, 10, 'Cylindrical');
figure;
ax = gca;
draw_waves(100, x, y, wave1, 'real', ax);

figure;
wave2 = Wave(-pi/4, 100, 10, 'Cylindrical');
ax = gca;
wave2.y0 = 5;
wave2 = wave2.refreshmesh();
draw_waves(100, x, y, wave1+wave2, 'abs', ax);

%% Unit test 2

wave1 = Wave(pi/4, 30, 1, "Gaussian");
wave2 = Wave(-pi/4, 30, 1, "Gaussian");

figure;
fig = gca;
draw_waves(100, linspace(-5, 5, 300), linspace(-5, 5, 300), wave1+wave2, 'real', fig);


%% Unit test 3
wave1 = Wave(pi/4, 30, 1, "Gaussian");
wave2 = Wave(-pi/4, 30, 1, "Gaussian");

figure;
fig = gca;
simulate_wave(3, 0, linspace(-5, 5, 100), linspace(-5, 5, 100), wave1+wave2, fig);

%% Unit test 4
wave1 = Wave(pi/4, 20, 1, "Cylindrical");
wave2 = Wave(-pi/4, 20, 1, "Gaussian");

figure;
fig = gca;
create_video_wave(10, 70, 40, linspace(-5, 5, 300), linspace(-5, 5, 300), wave1+wave2, fig);