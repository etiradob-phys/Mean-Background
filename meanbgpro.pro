function meanbgpro,vect,position,pixels, BAD_VECT = bad_vect

;+
; NAME:
;     meanbgpro
; PURPOSE:
;     Procedure to get the mean around some pixels before and after of a given position pixel in a vector
;     it also gives the standard deviation of these pixels.
;
; EXPLANATION:
;     From a vector of integer or float data, a position pixel is given. After that, the pixels before and after
;     are identified. From the pixels around this sections, the mean is stablished for each gasp and the standard deviation. Then, these
;     values are returned.
;
; CALLING SEQUENCE
;       results = meanbgpro( vect, position, pixels, prom, stdev )
;
; INPUTS:
;       vect - input vector from which we want to calculate the mean. Float or Integer type.
;       position - pixel from which we want to stablish a mean around.
;       pixels - amount of pixels to consider before and after the position pixel.
;       
;       
; OUTPUTS:
;       The mean of the set of pixels around the position pixel is returned as the function value.
;       Output is -1 if vector is not integer neither float type. 
;
;       If pixels is not given, then it would have a value of 1
;       

; KEYWORD OUTPUTS
;
;        BAD_VECT set to 1B if is not integer neither float type.
;
; EXAMPLES:
;        testvec=[0,12,35,24.0,0,0,13.6,0,14.6,18.9,0,49.6,-15.8,6]
;        
;        nozeros
;
;
; HISTORY:


;-------------------------------------------------------------
;


;compile_opt idl2

program='meanbgpro.pro'                       ; Name of programs

var=vect
IF n_params() LT 3 THEN pixels=1  ELSE pixels=pixels                        ; Read the number of pixels to consider

sivar=size(var)
nsivar=sivar(1)                       ; Gets size of the vector input
meanarray=[position]

IF nsivar  EQ 1 THEN GOTO,skip_1       ;case vector is not an array

GOTO,other
FOR ii=1,pixels DO BEGIN
  
  IF position EQ 0 THEN GOTO,right
  IF position-0 LT ii THEN GOTO,right 
  
  leftpix=var(position-ii)
  meanarray=[meanarray,leftpix]
  
  right:
  IF position EQ nsivar-1 THEN GOTO,fin
  IF nsivar-1-position LT ii THEN GOTO,fin

  rightpix=var(position+ii)
  meanarray=[meanarray,rightpix]
  
  fin:
ENDFOR
other:

leftpix=position
rightpix=position

FOR ii=1,pixels DO BEGIN
  
  IF position EQ 0 THEN GOTO,right1
  IF position-0 LT ii THEN GOTO,right1
  
  leftpix=position-ii
  
  right1:
  IF position EQ nsivar-1 THEN GOTO,fin1
  IF nsivar-1-position LT ii THEN GOTO,fin1

  rightpix=position+ii
  
  fin1:
ENDFOR

;promvarianz=moment(meanarray)
promvarianz=moment(var[leftpix:rightpix])
prom=promvarianz(0)
varianz=promvarianz(1)
stdevi=sqrt(varianz)

output=[prom,stdevi]

bad_vect = 0B
return,output

;======================================================================
;===================== Invalid out section   ==========================
;======================================================================

;NOTVALID:
;bad_vect = 1B
;message, 'Invalid input date specified', /INFORMATIONAL
;return, -1
skip_1:

END