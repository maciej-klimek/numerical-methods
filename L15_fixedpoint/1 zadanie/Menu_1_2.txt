using Bits;
using Printf


function display_data()
    println("=== Przykłady danych w różnych typach ===")

    println("\n--- Float32 przykład ---")
    display_float32_data()

    println("\n--- Integer przykłady ---")
    display_integer_data()

    println("\n--- Float16, Float64, BigFloat przykłady ---")
    display_float_examples()

    println("\n--- Inf, -Inf, NaN przykłady ---")
    display_special_numbers()

    println("\n--- Konwersje między typami ---")
    display_type_conversions()

    println("\n--- Konwersje między epsilon values ---")
    display_epsilon_values()
end

function display_float32_data()
    eps_float32 = eps(Float32)
    println("eps(Float32): ", eps_float32)
    println("bits(eps(Float32)): ", bits(eps_float32))
    println("bits(1.0 + eps(Float32)/2): ", bits(1.0 + eps(Float32)/2))
    println("bits(1.0 + eps(Float32)): ", bits(1.0 + eps(Float32)))
    println("bits(1.0 + 2 * eps(Float32)): ", bits(1.0 + 2 * eps(Float32)))
    println("bits(Float32(Inf)): ", bits(Float32(Inf)))
    println("bits(Float32(-Inf)): ", bits(Float32(-Inf)))
    println("bits(Float32(NaN)): ", bits(Float32(NaN)))
    println("bits(Float32(-0.009765625)): ", bits(Float32(-0.009765625)))
    println("bitstring(reinterpret(Float32, UInt32(parse(Int, bitstring(Float32(2.0)^(-126-3)), base=2)))): ",
        bitstring(reinterpret(Float32, UInt32(parse(Int, bitstring(Float32(2.0)^(-126-3)), base=2)))))
    println("Float32((10.)^3) + Float32((10.)^(3-8)): ", Float32((10.)^3) + Float32((10.)^(3-8)))
end

function display_integer_data()
    x_int8 = Int8(42)
    println("Int8: ", x_int8)

    x_int16 = Int16(1000)
    println("Int16: ", x_int16)

    x_int32 = Int32(-50000)
    println("Int32: ", x_int32)

    x_int64 = Int64(1234567890123456789)
    println("Int64: ", x_int64)

    x_int128 = Int128(-987654321098765432109876543210)
    println("Int128: ", x_int128)

    value_uint8 = UInt8(255)
    println("UInt8: ", value_uint8)

    value_uint16 = UInt16(65535)
    println("UInt16: ", value_uint16)

    value_uint32 = UInt32(4294967295)
    println("UInt32: ", value_uint32)

    value_uint64 = UInt64(18446744073709551615)
    println("UInt64: ", value_uint64)

    value_uint128 = UInt128(340282366920938463463374607431768211455)
    println("UInt128: ", value_uint128)

    value_bigint = parse(BigInt, "12345678901234567890123456789012345678901234567890")
    println("BigInt: ", value_bigint)
end

function display_float_examples()
    value_float16 = Float16(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117)
    println("Float16: ", value_float16)

    value_float32 = Float32(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117)
    println("Float32: ", value_float32)

    value_float64 = Float64(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117)
    println("Float64: ", value_float64)

    value_bigfloat = BigFloat(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117)
    println("BigFloat: ", value_bigfloat)
end

function display_special_numbers()
    positive_inf = Inf
    negative_inf = -Inf
    nan = NaN

    println("Positive Inf: ", positive_inf)
    println("Negative Inf: ", negative_inf)
    println("NaN: ", nan)
end

function display_type_conversions()
    A = Int64(1234)
    F = Float16(1.125)
    B = Float64(A)

    println("Int64: ", A)
    println("Float16: ", F)
    println("Float64 (converted from Int64): ", B)
end

function display_epsilon_values()
    # Ustalamy wartości epsilona dla różnych typów zmiennoprzecinkowych
    tol = eps(Float16), eps(Float32), eps(Float64), eps(BigFloat)

    # Dodajemy epsilon Float64 do Float16 (bez przypisania wyniku)
    result_1 = Float16(1.0) + eps(Float64)

    # Tworzymy zmienną a i dodajemy do niej epsilon Float16
    a = Float16(1.25)
    b = a + eps(Float16)

    # Wyświetlamy reprezentację bitową zmiennej b
    bit_representation_b = bits(b)

    println("Epsilon values: ", tol)
    println("Result of Float16(1.0) + eps(Float64): ", result_1)
    println("Bit representation of variable b: ", bit_representation_b)
end

# Wywołanie funkcji do wyświetlenia danych
display_data()
