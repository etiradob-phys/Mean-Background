# Mean-Background
# NAME:
     meanbgpro
# PURPOSE:
     Procedure to get the mean around some pixels before and after of a given position pixel in a vector
     it also gives the standard deviation of these pixels.

# EXPLANATION:
     A position pixel is given from a vector of integer or float data. After that, the pixels before and after are identified. 
     The pixels around this section establish the mean for each gasp and the standard deviation. Then, these values are returned.

# CALLING SEQUENCE
       results = meanbgpro( vect, position, pixels, prom, stdev )

# INPUTS:
       vect - input vector from which we want to calculate the mean. Float or Integer type.
       position - pixel from which we want to establish a mean around.
       pixels - amount of pixels to consider before and after the position pixel.
            
# OUTPUTS:
       The mean of the set of pixels around the position pixel is returned as the function value.
       Output is -1 if vector is not integer neither float type. 

       If pixels is not given, then it would have a value of 1
       
# KEYWORD OUTPUTS

        BAD_VECT set to 1B if is not integer neither float type.

# EXAMPLES:
        testvec=[0,12,35,24.0,0,0,13.6,0,14.6,18.9,0,49.6,-15.8,6]
        
        nozeros

# HISTORY:


;-------------------------------------------------------------
