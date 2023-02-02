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
function NextPrime(currNum)

    # Set initial variable states
    prime_found = false
    isPrime = true
    global prime_list = [2, 3]

    # Initialize prime_list and end if called with low input
    if currNum < 3
        return nothing
    end

    if currNum % 6 == 1
        currNum += 4
    else
        currNum += 2
    end

    while prime_found == false
        for prime in prime_list[prime_list .≤ floor(sqrt(currNum))]
            if currNum % prime == 0
                isPrime = false
                break
            end
        end

        if isPrime == true
            push!(prime_list, currNum)
            prime_found = true
        end
    end
end
function AFactorize(n)
    # Initialize prime_list
    NextPrime(1)
    # Initialize variables and arrays
    index = 1
    prime = prime_list[index]
    factors = [1]
    
    while n > 1
        if n % prime == 0
            push!(factors, prime)
            while n % prime == 0
                n ÷= prime
            end
            # println("Previous Array length is "*string(length(prime_list)))
            NextPrime(prime) # [2, 3, 5]
            for p in prime_list
                if p != prime_list[end]
                    print(" $p,")
                else
                    print(" $p\n")
                end
            end
            # println("After Array length is "*string(length(prime_list)))
            index += 1 # index = 3
            prime = prime_list[index]
            # println(prime)
        else
            if PrimeTest(n, 5)
                push!(factors, n)
                for p in factors
                    if p != factors[end]
                        print(" $p,")
                    else
                        print(" $p\n")
                    end
                end
                return nothing
            else
                NextPrime(prime) # [2, 3] -> [2, 3, 5, 7]
                for p in prime_list
                    if p != prime_list[end]
                        print(" $p,")
                    else
                        print(" $p\n")
                    end
                end
                index += 1 # index = 2 -> 4
                # println("Index is $index")
                # println("Array length is "*string(length(prime_list)))
                prime = prime_list[index] # prime = 3 -> 7
            end
        end
    end
end

@timev AFactorize(21848463)