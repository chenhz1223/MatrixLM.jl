"""
    Mlm_plots(tStats::Matrix{Float64}, n::Int64, colNames::Matrix{String}})

Plot the t-statistics of the coefficients.
#Inputs:
tStats::Matrix{Float64}: a matrix of t-statistics
n::Int64: the number of rows in the t-statistics MatrixLM
colNames::Matrix{string}: the column names of the columns in the t-statistics matrix.

"""
@userplot Mlm_plots

@recipe function f(x::Mlm_plots)
    mB = x.args[1]
    nrow = x.args[2]
    ticks = x.args[3]
    V = mB[:,nrow]
    
    # return error message if the input arugment is different from `AbstractMatrix`
    typeof(mB) <: AbstractMatrix || error("Pass a Matrix as the arg to lineplot")
    # get size of input matrix
    #rows, cols = size(mB)
    
    # turn off the background grid
    grid := false                      
    
    title --> string("T-statistics of Coefficients Estimates")
    xlabel --> "Variables"
    ylabel --> "T-statistics"
    xrotation --> 20
    legend --> false
    label --> "y1"
    
    xticks := (collect(1:length(ticks)), ticks)
    # add a series for an error band
    @series begin
        seriestype := :path
        #primary := false
        linecolor --> :blue
        markershape --> :circle
        
        # return series data
        V
    end
    
end