function PrimeGen(endpoint, currNum)

    # Set initial variable states
    if currNum % 6 == 1
        addTwo = false
    else
        addTwo = true
    end

    isPrime = true
    
    global prime_list = [2, 3]

    while endpoint ≥ currNum
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
    # for p in prime_list
    #     if p != prime_list[end]
    #         print(" $p,")
    #     else
    #         print(" $p\n")
    #     end
    # end
end

# standalone
# print("Enter endpoint: ")
# endpoint = readline()
# print("Enter startpoint: ")
# startpoint = readline()
# @time PrimeGen(parse(Int64, endpoint), parse(Int64, startpoint))
