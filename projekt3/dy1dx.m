function ret = dy1dx(t, y)
    ret = y(2) + y(1) * (0.3 - y(1)^2 - y(2)^2);
end