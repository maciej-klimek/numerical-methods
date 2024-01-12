x1_arr=[2, 1, -2];
x2_arr=[3, 5, 1];

a_arr = [tan(deg2rad(45))/2;
           tan(deg2rad(5))/2;
           tan(deg2rad(80))/2];

names_arr = ["5 stopni", "45 stopni", "80 stopni"];

x = linspace(-5, 5, 100);
y_zero=zeros(size(x));

for k=1:3
    a = a_arr(k);
    x1 = x1_arr(k);
    x2 = x2_arr(k);
    f = @(x) a * (x - x1) .* (x - x2);
    df = @(x) 2 * a * x - a * (x1 + x2);

    it = 20;
    a_lim = 0; 
    b_lim = 2.5;

    newton_raphson = nonlinsolvers(f, df, a_lim, b_lim, 'newton-raphson', it);
    subplot(3, 1, k);
    plot( 1:it,newton_raphson,'o-'); xlabel('iter'); ylabel('cb(iter)');
    for l=1:it
        if abs(newton_raphson(l) - x1_arr(k)) < 0.001 /100 || abs(newton_raphson(l) - x2_arr(k)) < 0.001 /100
            disp('Liczba iteracji dla '+ names_arr(k));
            disp(l);
            disp(newton_raphson(l));
            break;
        end
    end
end