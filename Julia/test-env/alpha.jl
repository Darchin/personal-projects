function PrimeGen(x)

    addTwo = true
    isPrime = true
    currNum = 5
    global prime_list = [2, 3]

    while x ≥ currNum
        for prime in prime_list[prime_list .≤ floor(sqrt(currNum))]
            if currNum % prime == 0
                isPrime = false
                break
            end
        end

        if isPrime == true
            push!(prime_list, currNum)
        else
            isPrime = true
        end

        if addTwo == true
            currNum += 2
            addTwo = false
        else
            currNum += 4
            addTwo = true
        end
    end
end

function Factorize(x)
    initial_num = x
    PrimeGen(x/2)
    prime_factors = []
    for p in prime_list
        div = x / p
        if isinteger(div)
            push!(prime_factors, p)
            x = div
        end
    end

    if length(prime_factors) != 0
        for p in prime_factors
            if p != prime_factors[end]
                print(" $p,")
            else
                print(" $p\n")
            end
        end
    else
        print("$initial_num\n")
    end
end

print("Enter a number: ")
num = readline()
@time Factorize(parse(Int64, num))