function r = testFun(n)
   if n <= 0
     r = 1;
   else
     r = n * testFun(n-1);
   end
 end

