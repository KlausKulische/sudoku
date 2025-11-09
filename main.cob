       identification division.
       program-id. sudoku_solver.

       environment division.
       input-output section.
        file-control.

       data division.
       file section.

       working-storage section.
       01 ws-row-1.
         05 ws-column-1-1 pic 9 value 1.
         05 ws-column-1-2 pic 9 value 2.
         05 ws-column-1-3 pic 9 value 3.
         05 ws-column-1-4 pic 9 value 4.
         05 ws-column-1-5 pic 9 value 5.
         05 ws-column-1-6 pic 9 value 6.
         05 ws-column-1-7 pic 9 value 7.
         05 ws-column-1-8 pic 9 value 8.
         05 ws-column-1-9 pic 9 value 9.

       01 ws-row-2.
         05 ws-column-2-1 pic 9 value 2.
         05 ws-column-2-2 pic 9 value 3.
         05 ws-column-2-3 pic 9 value 4.
         05 ws-column-2-4 pic 9 value 5.
         05 ws-column-2-5 pic 9 value 6.
         05 ws-column-2-6 pic 9 value 7.
         05 ws-column-2-7 pic 9 value 8.
         05 ws-column-2-8 pic 9 value 9.
         05 ws-column-2-9 pic 9 value 1.

       01 ws-row-3.
         05 ws-column-3-1 pic 9 value 3.
         05 ws-column-3-2 pic 9 value 4.
         05 ws-column-3-3 pic 9 value 5.
         05 ws-column-3-4 pic 9 value 6.
         05 ws-column-3-5 pic 9 value 7.
         05 ws-column-3-6 pic 9 value 8.
         05 ws-column-3-7 pic 9 value 9.
         05 ws-column-3-8 pic 9 value 1.
         05 ws-column-3-9 pic 9 value 2.

       01 ws-row-4.
         05 ws-column-4-1 pic 9 value 4.
         05 ws-column-4-2 pic 9 value 5.
         05 ws-column-4-3 pic 9 value 6.
         05 ws-column-4-4 pic 9 value 7.
         05 ws-column-4-5 pic 9 value 8.
         05 ws-column-4-6 pic 9 value 9.
         05 ws-column-4-7 pic 9 value 1.
         05 ws-column-4-8 pic 9 value 2.
         05 ws-column-4-9 pic 9 value 3.

       01 ws-row-5.
         05 ws-column-5-1 pic 9 value 5.
         05 ws-column-5-2 pic 9 value 6.
         05 ws-column-5-3 pic 9 value 7.
         05 ws-column-5-4 pic 9 value 8.
         05 ws-column-5-5 pic 9 value 9.
         05 ws-column-5-6 pic 9 value 1.
         05 ws-column-5-7 pic 9 value 2.
         05 ws-column-5-8 pic 9 value 3.
         05 ws-column-5-9 pic 9 value 4.

       01 ws-row-6.
         05 ws-column-6-1 pic 9 value 6.
         05 ws-column-6-2 pic 9 value 7.
         05 ws-column-6-3 pic 9 value 8.
         05 ws-column-6-4 pic 9 value 9.
         05 ws-column-6-5 pic 9 value 1.
         05 ws-column-6-6 pic 9 value 2.
         05 ws-column-6-7 pic 9 value 3.
         05 ws-column-6-8 pic 9 value 4.
         05 ws-column-6-9 pic 9 value 5.

       01 ws-row-7.
         05 ws-column-7-1 pic 9 value 7.
         05 ws-column-7-2 pic 9 value 8.
         05 ws-column-7-3 pic 9 value 9.
         05 ws-column-7-4 pic 9 value 1.
         05 ws-column-7-5 pic 9 value 2.
         05 ws-column-7-6 pic 9 value 3.
         05 ws-column-7-7 pic 9 value 4.
         05 ws-column-7-8 pic 9 value 5.
         05 ws-column-7-9 pic 9 value 6.

       01 ws-row-8.
         05 ws-column-8-1 pic 9 value 8.
         05 ws-column-8-2 pic 9 value 9.
         05 ws-column-8-3 pic 9 value 1.
         05 ws-column-8-4 pic 9 value 2.
         05 ws-column-8-5 pic 9 value 3.
         05 ws-column-8-6 pic 9 value 4.
         05 ws-column-8-7 pic 9 value 5.
         05 ws-column-8-8 pic 9 value 6.
         05 ws-column-8-9 pic 9 value 7.

       01 ws-row-9.
         05 ws-column-9-1 pic 9 value 9.
         05 ws-column-9-2 pic 9 value 1.
         05 ws-column-9-3 pic 9 value 2.
         05 ws-column-9-4 pic 9 value 3.
         05 ws-column-9-5 pic 9 value 4.
         05 ws-column-9-6 pic 9 value 5.
         05 ws-column-9-7 pic 9 value 6.
         05 ws-column-9-8 pic 9 value 7.
         05 ws-column-9-9 pic 9 value 8.

       01 ws-row-sum-1 pic 99 value 0.
       01 ws-row-sum-2 pic 99 value 0.
       01 ws-row-sum-3 pic 99 value 0.
       01 ws-row-sum-4 pic 99 value 0.
       01 ws-row-sum-5 pic 99 value 0.
       01 ws-row-sum-6 pic 99 value 0.
       01 ws-row-sum-7 pic 99 value 0.
       01 ws-row-sum-8 pic 99 value 0.
       01 ws-row-sum-9 pic 99 value 0.
       77 ws-row-sum-all pic 99 value 45.
       01 ws-row-true pic 9 value 0.
            
       01 ws-col-sum-1 pic 99 value 0.
       01 ws-col-sum-2 pic 99 value 0.
       01 ws-col-sum-3 pic 99 value 0.
       01 ws-col-sum-4 pic 99 value 0.
       01 ws-col-sum-5 pic 99 value 0.
       01 ws-col-sum-6 pic 99 value 0.
       01 ws-col-sum-7 pic 99 value 0.
       01 ws-col-sum-8 pic 99 value 0.
       01 ws-col-sum-9 pic 99 value 0.
       77 ws-col-sum-all pic 99 value 45.
       01 ws-col-true pic 9 value 0.

       procedure division.
           perform calc-col-summery thru end-calc-col-summery.
           perform calc-row-summery thru end-calc-row-summery.
           perform compare-row thru end-compare-row.
           perform compare-col thru end-compare-col.
           display "col sum 1 " ws-col-sum-1 " row sum 1 " ws-row-sum-1.
           display "col sum 2 " ws-col-sum-2 " row sum 2 " ws-row-sum-2.
           display "col sum 3 " ws-col-sum-3 " row sum 3 " ws-row-sum-3.
           display "col sum 4 " ws-col-sum-4 " row sum 4 " ws-row-sum-4.
           display "col sum 5 " ws-col-sum-5 " row sum 5 " ws-row-sum-5.
           display "col sum 6 " ws-col-sum-6 " row sum 6 " ws-row-sum-6.
           display "col sum 7 " ws-col-sum-7 " row sum 7 " ws-row-sum-7.
           display "col sum 8 " ws-col-sum-8 " row sum 8 " ws-row-sum-8.
           display "col sum 9 " ws-col-sum-9 " row sum 9 " ws-row-sum-9.
           display "true col " ws-col-true.
           display "true row " ws-row-true.

       compare-col section.
           if ws-col-sum-all equal ws-col-sum-1 and ws-col-sum-2 and
             ws-col-sum-3 and ws-col-sum-4 and ws-col-sum-5 and
             ws-col-sum-6 and ws-col-sum-7 and ws-col-sum-8 and
             ws-col-sum-9 
           then move 1 to ws-col-true
           end-if.
       end-compare-col.
       
       compare-row section.
           if ws-row-sum-all equal ws-row-sum-1 and ws-row-sum-2 and
             ws-row-sum-3 and ws-row-sum-4 and ws-row-sum-5 and
             ws-row-sum-6 and ws-row-sum-7 and ws-row-sum-8 and
             ws-row-sum-9 
           then move 1 to ws-row-true
           end-if.
       end-compare-row.

       calc-row-summery section.
           compute ws-row-sum-1 = ws-column-1-1 + ws-column-1-2 +
           ws-column-1-3 + ws-column-1-4 + ws-column-1-5 +
           ws-column-1-6 + ws-column-1-7 + ws-column-1-8 + ws-column-1-9
           end-compute.
           compute ws-row-sum-2 = ws-column-2-1 + ws-column-2-2 +
           ws-column-2-3 + ws-column-2-4 + ws-column-2-5 +
           ws-column-2-6 + ws-column-2-7 + ws-column-2-8 + ws-column-2-9
           end-compute.
           compute ws-row-sum-3 = ws-column-3-1 + ws-column-3-2 +
           ws-column-3-3 + ws-column-3-4 + ws-column-3-5 +
           ws-column-3-6 + ws-column-3-7 + ws-column-3-8 + ws-column-3-9
           end-compute.
           compute ws-row-sum-4 = ws-column-4-1 + ws-column-4-2 +
           ws-column-4-3 + ws-column-4-4 + ws-column-4-5 +
           ws-column-4-6 + ws-column-4-7 + ws-column-4-8 + ws-column-4-9
           end-compute.
           compute ws-row-sum-5 = ws-column-5-1 + ws-column-5-2 +
           ws-column-5-3 + ws-column-5-4 + ws-column-5-5 +
           ws-column-5-6 + ws-column-5-7 + ws-column-5-8 + ws-column-5-9
           end-compute.
           compute ws-row-sum-6 = ws-column-6-1 + ws-column-6-2 +
           ws-column-6-3 + ws-column-6-4 + ws-column-6-5 +
           ws-column-6-6 + ws-column-6-7 + ws-column-6-8 + ws-column-6-9
           end-compute.
           compute ws-row-sum-7 = ws-column-7-1 + ws-column-7-2 +
           ws-column-7-3 + ws-column-7-4 + ws-column-7-5 +
           ws-column-7-6 + ws-column-7-7 + ws-column-7-8 + ws-column-7-9
           end-compute.
           compute ws-row-sum-8 = ws-column-8-1 + ws-column-8-2 +
           ws-column-8-3 + ws-column-8-4 + ws-column-8-5 +
           ws-column-8-6 + ws-column-8-7 + ws-column-8-8 + ws-column-8-9
           end-compute.
           compute ws-row-sum-9 = ws-column-9-1 + ws-column-9-2 +
           ws-column-9-3 + ws-column-9-4 + ws-column-9-5 +
           ws-column-9-6 + ws-column-9-7 + ws-column-9-8 + ws-column-9-9
           end-compute.
       end-calc-row-summery.
        
       calc-col-summery section.
           compute ws-col-sum-1 =
           ws-column-1-1 + ws-column-2-1+ws-column-3-1+ws-column-4-1+
           ws-column-5-1+ws-column-6-1+ws-column-7-1+ws-column-8-1+
           ws-column-9-1 end-compute.
           compute ws-col-sum-2 =
           ws-column-1-2+ws-column-2-2+ws-column-3-2+ws-column-4-2+
           ws-column-5-2+ws-column-6-2+ws-column-7-2+ws-column-8-2+
           ws-column-9-2 end-compute.
           compute ws-col-sum-3 =
           ws-column-1-3+ws-column-2-3+ws-column-3-3+ws-column-4-3+
           ws-column-5-3+ws-column-6-3+ws-column-7-3+ws-column-8-3+
           ws-column-9-3 end-compute.
           compute ws-col-sum-4 =
           ws-column-1-4+ws-column-2-4+ws-column-3-4+ws-column-4-4+
           ws-column-5-4+ws-column-6-4+ws-column-7-4+ws-column-8-4+
           ws-column-9-4 end-compute.
           compute ws-col-sum-5 =
           ws-column-1-5+ws-column-2-5+ws-column-3-5+ws-column-4-5+
           ws-column-5-5+ws-column-6-5+ws-column-7-5+ws-column-8-5+
           ws-column-9-5 end-compute.
           compute ws-col-sum-6 =
           ws-column-1-6+ws-column-2-6+ws-column-3-6+ws-column-4-6+
           ws-column-5-6+ws-column-6-6+ws-column-7-6+ws-column-8-6+
           ws-column-9-6 end-compute.
           compute ws-col-sum-7 =
           ws-column-1-7+ws-column-2-7+ws-column-3-7+ws-column-4-7+
           ws-column-5-7+ws-column-6-7+ws-column-7-7+ws-column-8-7+
           ws-column-9-7 end-compute.
           compute ws-col-sum-8 =
           ws-column-1-8+ws-column-2-8+ws-column-3-8+ws-column-4-8+
           ws-column-5-8+ws-column-6-8+ws-column-7-8+ws-column-8-8+
           ws-column-9-8 end-compute.
           compute ws-col-sum-9 =
           ws-column-1-9+ws-column-2-9+ws-column-3-9+ws-column-4-9+
           ws-column-5-9+ws-column-6-9+ws-column-7-9+ws-column-8-9+
           ws-column-9-9 end-compute.
       end-calc-col-summery.

       end program sudoku_solver.

