function ret = dydx(t, y)
    ret_1 = dy1dx(t, y);
    ret_2 = dy2dx(t, y);
    ret = [ret_1; ret_2];
end

