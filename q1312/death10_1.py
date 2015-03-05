a='GT'
b=a*5+'T'+a*2+'TTGTT'
print(''.join({'T':'tree','F':'fire','G':'gold','W':'water','M':'moon'}[e] for e in 'TTTF'+a+'TTT'+b+'TWWTTWG'+b+'FGGWMTMTG'+a+'WG'+a+'TG'+a+'TMWGGW'+a+'TMGGM'))