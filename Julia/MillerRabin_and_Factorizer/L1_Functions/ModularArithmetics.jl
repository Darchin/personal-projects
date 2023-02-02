function ModularExponentiation(x, y, n)
    result = 1

    while y > 0
        if (y & 1) == 1
            result = (result * x) % n
        end
    
        y = y >> 1 # y -= 1 && y =/ 2
        x = (x*x) % n
    end

    return result
end