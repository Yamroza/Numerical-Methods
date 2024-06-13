function ret = dy2dx(t, y)
    ret = -y(1) + y(2) * (0.3 - y(1)^2 - y(2)^2);
end


