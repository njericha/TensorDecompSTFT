module TensorDecompSTFT

export greet

"""
    greet(::Any)

Prints "Hello World!"
"""
greet() = print("Hello World!")

using STFT

"""
    hann(n::Int)
Makes a Hann window with N samples with peak value of 1.
If N is even, will return N+1 samples.
"""

function hann(N::Int)
    N = N - N % 2 #makes N even
    n = 0:N
    return @. sin(π*n/N)^2
end

"""
    triange(n::Int)
Makes a single triangle bump with n samples with peak value of 1
"""

function triangle(n::Int)
    up   = range(0,1,length=(n+1)÷2)
    down = reverse(up)[2:end]
    return cat(up, down,dims=1)
end

"""
    songread(n::Int)
Wrapper to open a song file
"""

function songread(filename::String)
    y, fs = wavread(filename)
    N = length(y)
    t = range(0, N/fs, length=N)
    return y, t, fs
end

end # module TensorDecompSTFT