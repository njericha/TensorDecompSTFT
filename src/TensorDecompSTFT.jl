module TensorDecompSTFT

export greet, mySTFT

"""
    greet(::Any)

Prints "Hello World!"
"""
greet() = print("Hello World!")

using FFTW

"""
    _stft(x_odd_extention, window)
Helper function that takes the odd extention of x (length 3N
where N isthe number of samples of x), and a window of length 2N,
abd computes the fft of the windowed signal.
"""

function _stft(x_odd_extention, window)
    N = length(window)÷2 #original length of signal
    n_time_steps = N
    X = zeros(Complex, N, n_time_steps)
    for i ∈ 1:n_time_steps
        left  = i
        right = i + 2N-1
        slice = left:right
        x_trunc = x_odd_extention[slice]
        X[:,i]  = fft(x_trunc .* window)[1:N]#Just want the non negative frequencies
    end
    return X
end

"""
    STFT(x::Vector{Complex}, t::Vector{Real}, width::Real)

Takes ```math x(t)``` and returns the STFT of x, X, and the frequencies k.
A Gaussian window is used with the width needed as an input.

Example:
```julia
t = Vector(range(0, 1, 1000)) # Time points
x = sin.(2π*200t.^2) # Generate chirp signal
width = 0.01 #window size
X, k = mySTFT(x, t, width)
s = abs2.(X) # get magnitude
heatmap(t, k, s) # plot
```
"""
function mySTFT(x, t, width)#::Vector{Complex}, t::AbstractVector, width::Real)
    # Make window
    N = length(t)
    right = (t[end] - t[1])
    left  = - right #+ length(t) % 2
    times = Vector(range(left, right, 2N))
    window = exp.(-(times ./ width).^2 ./ 2)
    
    # Make odd extention of x
    xr = -reverse(x)
    odd_extention = cat(xr, x, xr, dims=1) # could make this better by not duplicating x(t[1])
    
    # Take STFT
    X = _stft(odd_extention, window)#stft(odd_extention, window, N)#
    
    # Calculate frequencies
    Δt = t[2] - t[1]
    sample_rate = 1 / Δt
    k = Vector(range(0, sample_rate/2, N))

    return X, k
end

end # module TensorDecompSTFT