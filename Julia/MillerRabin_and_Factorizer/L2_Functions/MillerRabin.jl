include(pwd()*"/../L1_Functions/ModularArithmetics.jl")

function PrimeTest(N, K)
    # declaring variables
    d = N - 1

    # handle cases 4 and below
    if N == 1 || N == 4
        return false
    elseif N ≤ 3
        return true
    end

    # divisibility by 2
    if N % 2 == 0
        return false
    end

    # find d such that n-1 can be written as d * 2^r
    while d % 2 == 0
        d ÷= 2
    end

    # run MillerRabin k times
    for num in 1:K
        if MillerRabin(N, d) == false
            return false
        end
    end
    return true
end


function MillerRabin(n, d)
    a = rand(2:(n-2))
    x = ModularExponentiation(a, d, n)

    if x == 1 || x == (n - 1)
        return true
    end

    while d != (n - 1)
        x = (x * x) % n
        d *= 2
        if x == 1
            return false
        elseif x == (n - 1)
            return true
        end
    end

    return false
end

# main program
print("Enter a number: ")
num = parse(BigInt, readline())
print("Enter confidence level: ")
conf = parse(UInt8, readline())

if PrimeTest(num, conf) == true
    print("Result: Prime\n")
else
    print("Result: Not Prime\n")
end