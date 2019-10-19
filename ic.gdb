# Create the first breakpoint at the start of the function.
set break function_name # create first breakpoint
run                     # start execution

# Create the second breakpoint by running up to the end of the function. In
# order not to lose the instruction count for this first execution we also
# perform the recording step.
record full             # start recording
finish                  # run up to end of function
info record             # print recording data
record stop             # erase recording data
break                   # create the second breakpoint
continue                # resume execution

# Now that we have two breakpoints in the right places, execute the rest of the
# program, whilst always stopping in order to perform the measurements.
while 1
  record full           # start recording
  finish                # run up to the end of function
  info record           # print recording data
  record stop           # erase recording
  continue              # resume execution
end
