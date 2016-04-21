load("./config.dat");

if (plotkrange)
    system(runkrangeplot);
endif

if (plotwave)
   system(runwaveplot);
endif

if (plotparabola)
   system(runparabolaplot);
endif

if (plotbparabola)
   system(runbparabolaplot);
endif
