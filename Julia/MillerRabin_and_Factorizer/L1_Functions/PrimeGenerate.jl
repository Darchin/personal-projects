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

    # print results
    for p in prime_list
        if p != prime_list[end]
            print(" $p,")
        else
            print(" $p\n")
        end
    end
end

# standalone
print("Enter a number: ")
num = readline()
@time PrimeGen(parse(Int64, num))